# SADA Systems' Terraform Modules

This repo contains Terraform modules for AWS and GCP. If you wish to use these modules, please endeavour to keep these modules separate from your calling Terraform code. In other words, this repo should house re-usable modules and nothing more.

<!-- toc -->

- [Standalone Modules](#standalone-modules)
- [Development Dependencies](#development-dependencies)
    * [Optional Dependencies](#optional-dependencies)
    * [Pre-commit Hooks](#pre-commit-hooks)
- [License](#license)

<!-- tocstop -->

## Standalone Modules

This being a collection of smaller modules, some are upstream and belong on their own. Here's a list of ones frequently used:

- [Titan/Colossus](https://github.com/sadasystems/titan) is a network module. The former is for AWS, latter for GCP. [This is the upstream repo](https://github.com/naftulikay/titan), to be used for syncing the SADA Systems one, rather than as a primary module on code for clients.
- [KatyPerry](https://github.com/sadasystems/katyperry) is a simple implementation of managed Kubernetes clusters for both AWS (EKS) and GCP (GKE). Downstream from [Naftuli K.](https://github.com/naftulikay/katyperry), see above for usage.

## Development Dependencies

- [`git`](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) is required to manipulate this repository's code
- [`terraform`](https://learn.hashicorp.com/terraform/getting-started/install.html) is a tool for building, changing, and versioning infrastructure safely and efficiently.

### Optional Dependencies

- [`terragrunt`](https://github.com/gruntwork-io/terragrunt#install-terragrunt) is a thin wrapper for Terraform that provides extra tools for keeping your Terraform configurations DRY, working with multiple Terraform modules, and managing remote state.
- [`markdown-toc`](https://github.com/smaslennikov/markdown-toc) is a Markdown table of contents generator

### Pre-commit Hooks

[pre-commit](https://pre-commit.com/#install) is a framework for managing and maintaining multi-language pre-commit hooks. The following define hooks to be used here:

=======
- `.pre-commit-config.yaml`
- `.hooks`

## License

 * [Apache License, Version 2.0][license-apache]: [`./LICENSE-APACHE`][license-apache-local]
 * [MIT License][license-mit]: [`./LICENSE-MIT`][license-mit-local]

Licensed at your option of either of the above licenses.

[license-mit]: https://opensource.org/licenses/MIT
[license-mit-local]: LICENSE-MIT
[license-apache]: https://www.apache.org/licenses/LICENSE-2.0
[license-apache-local]: LICENSE-APACHE
