variable "name" { }
variable "slaves_count" { }
variable "testing_cidr" { type = "list" }
variable "subnet_id" { }
variable "vpc_name" { }
variable "subnet_cidr" { }
variable "region" { }
variable "ssh-keys" { }
variable "data_disk_size" { }
variable "instance_type" { }

variable "redis-base-initscript" {
  default = <<INITSCRIPT
set -ex

echo vm.overcommit_memory=1 >> /etc/sysctl.conf
echo net.core.somaxconn=1024 >> /etc/sysctl.conf
sysctl -p
echo never > /sys/kernel/mm/transparent_hugepage/enabled

yum update
yum install -y gcc wget

groupadd redis
useradd -d /var/lib/redis -g redis -m -s /sbin/nologin redis

wget http://download.redis.io/redis-stable.tar.gz
tar xfz redis-stable.tar.gz && cd redis-stable

make -C deps/ hiredis lua linenoise jemalloc
make
make install
cp redis.conf /etc/redis.conf
chown redis:redis /etc/redis.conf /usr/local/bin/redis-*
sed -i \
    -e "s#^bind.*\$#bind $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')#g" \
    -e 's#^pidfile.*$#pidfile /var/run/redis.pid#g' \
    -e 's#^dir.*$#dir /var/lib/redis/#g' \
  /etc/redis.conf

cat <<EOF >>/etc/systemd/system/redis-server.service
[Unit]
Description=Redis Server
After=network.target

[Service]
Type=simple
PIDFile=/var/run/redis.pid
User=redis
LimitNOFILE=65535
ExecStartPre=/bin/mkdir -p /var/lib/redis/logs
ExecStart=/usr/local/bin/redis-server /etc/redis.conf
ExecStop=/bin/kill -15 \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

chmod 664 /etc/systemd/system/redis-server.service
systemctl daemon-reload
systemctl enable redis-server

INITSCRIPT
}

variable "redis-final-initscript" {
  default = <<INITSCRIPT

systemctl restart redis-server

INITSCRIPT
}
