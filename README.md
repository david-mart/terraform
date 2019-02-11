# gcp_tf_modules

This repo contains GCP Terraform Modules. If you wish to use these modules, please endevour to keep these modules seperately from your calling Terraform code.  In other words, this repo should house re-usable modules and nothing more.


### Required Software/Libraries

The following is the list of required software needed to execute this code.  Instructions on how to install this software are outside the scope of this document, however, the following links will take you to the respective vendor sites for details on downloading and installing the necessary software:

* [Git]  - Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

* [Google Cloud SDK] - The Cloud SDK is a set of tools (gcloud, gsutils,etc.) for Cloud Platform.

* [Terraform] - Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

### Optional Software

This software is optional, however strongly recommended to help maintain the code readability and documentation.

[pre-commit] - A framework for managing and maintaining multi-language pre-commit hooks.

[NOTE]:  A pre-installed yaml files: `.pre-commit-config.yaml` is included in this repo + .hooks directory, which contains helper scripts for pre-commit.  You simply need to install pre-commit to use it.

[Git]: <https://git-scm.com/>
[Google Cloud SDK]: <https://cloud.google.com/sdk/>
[Terragrunt]: <https://github.com/gruntwork-io/terragrunt/releases/>
[Terraform]: <https://www.terraform.io/downloads.html/>
[pre-commit]: <https://pre-commit.com/>
[pre-commit-terraform]: <https://github.com/antonbabenko/pre-commit-terraform/>

## License

 * [Apache License, Version 2.0][license-apache]: [`./LICENSE-APACHE`][license-apache-local]
 * [MIT License][license-mit]: [`./LICENSE-MIT`][license-mit-local]

Licensed at your option of either of the above licenses.

[license-mit]: https://opensource.org/licenses/MIT
[license-mit-local]: LICENSE-MIT
[license-apache]: https://www.apache.org/licenses/LICENSE-2.0
[license-apache-local]: LICENSE-APACHE
