variable "replicaset" { }
variable "replica_count" { }
variable "testing_cidr" { type = "list" }
variable "subnet_id" { }
variable "vpc_name" { }
variable "subnet_cidr" { }
variable "region" { }
variable "ssh-keys" { }
variable "data_disk_size" { }
variable "instance_type" { default = "n1-highmem-2" }
variable "additional_tag" { default = "null" }

resource "google_compute_disk" "data" {
  count = "${var.replica_count}"

  name  = "mongo-data-${var.replicaset}-${count.index}"
  type  = "pd-ssd"
  zone  = "${var.region}-a"
  size  = "${var.data_disk_size}"
}

resource "google_compute_instance" "mongo" {
  count = "${var.replica_count}"

  allow_stopping_for_update = true
  name         = "mongo-${var.replicaset}-${count.index}"
  machine_type = "${var.instance_type}"
  zone         = "${var.region}-a"
  tags         = [
    "allow-public-ssh-mongo-${var.replicaset}",
    "allow-mongod-${var.replicaset}",
    "nat",
    "${var.additional_tag}"
  ]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  attached_disk {
    source = "${google_compute_disk.data.*.self_link[count.index]}"
  }

  metadata_startup_script = <<INITSCRIPT
set -ex

# standard installation guide: https://docs.mongodb.com/v3.2/tutorial/install-mongodb-on-red-hat/

cat <<EOF >>/etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOF

yum install -y mongodb-org

mkdir -p /data
parted -a optimal -s /dev/sdb mklabel gpt
parted -a optimal -s /dev/sdb mkpart primary xfs 0% 100%
mkfs.xfs -f /dev/sdb1
mount /dev/sdb1 /data
mkdir -p /data/db
chown -R mongod:mongod /data/db

semanage fcontext -a -t mongod_var_lib_t '/data/db.*'
chcon -Rv -u system_u -t mongod_var_lib_t '/data/db'
restorecon -R -v '/data/db'

sed -i '/bindIp:/s/^/#/g' /etc/mongod.conf
sed -i 's#dbPath:.*$#dbPath: /data/db#g' /etc/mongod.conf

# configuring replica sets: https://docs.mongodb.com/v3.2/tutorial/deploy-replica-set/

cat <<EOF >>/etc/mongod.conf
replication:
  replSetName: ${var.replicaset}
EOF

systemctl start mongod
chkconfig mongod on

INITSCRIPT

  metadata {
    ssh-keys = <<EOF
${var.ssh-keys}
EOF
  }

  network_interface {
    subnetwork = "${var.subnet_id}"
  }
}

resource "google_compute_firewall" "allow-mongod" {
 name    = "allow-mongod-${var.replicaset}"
 network = "${var.vpc_name}"

 allow {
   protocol = "tcp"
   ports    = ["27017"]
 }

 source_ranges = [
   "${var.testing_cidr}",
   "${var.subnet_cidr}"
 ]
 target_tags = ["allow-mongod-${var.replicaset}"]
}

resource "google_compute_firewall" "allow-public-ssh-mongo" {
 name    = "allow-public-ssh-mongo-${var.replicaset}"
 network = "${var.vpc_name}"

 allow {
   protocol = "tcp"
   ports    = ["22"]
 }

 source_ranges = [
   "${var.testing_cidr}",
 ]
 target_tags = ["allow-public-ssh-mongo-${var.replicaset}"]
}
