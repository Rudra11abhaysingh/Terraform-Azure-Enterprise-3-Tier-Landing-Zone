# ☁️ Azure Enterprise 3-Tier Landing Zone

> **Enterprise-grade Infrastructure as Code (IaC) project using
> Terraform and Microsoft Azure**\
> Modular • Secure • Scalable • Reusable • DevOps Ready

------------------------------------------------------------------------

## 🚀 Project Overview

This project implements a **modular Azure Enterprise 3-Tier Landing
Zone** using **Terraform**.

The architecture is designed to demonstrate how enterprise Azure
infrastructure can be provisioned using **Infrastructure as Code**,
reusable Terraform modules, secure networking patterns, and a foundation
for CI/CD automation.

### 🎯 Architecture Goals

-   🏗️ Build a reusable Azure landing-zone architecture
-   🔐 Implement network segmentation and security controls
-   🖥️ Deploy separate **Frontend, Backend, and Database VMs**
-   ⚖️ Distribute application traffic through an Azure Load Balancer
-   🌐 Provide controlled outbound connectivity using NAT Gateway
-   🛡️ Enable secure VM administration through Azure Bastion
-   🔑 Manage sensitive configuration through Azure Key Vault
-   🧩 Maintain reusable Terraform modules
-   🔄 Prepare the infrastructure for automated CI/CD
-   📈 Follow enterprise-oriented Infrastructure as Code practices

------------------------------------------------------------------------

## 🏛️ Architecture

``` text
                         🌍 Internet
                              │
                              ▼
                    ┌───────────────────┐
                    │  Azure Public IP  │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │ Azure Load        │
                    │ Balancer          │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │ Frontend / Web VM │
                    │   snet-web        │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │ Backend / App VM  │
                    │   snet-app        │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │ Database VM       │
                    │   snet-db         │
                    └───────────────────┘


        ┌──────────────────────────────────────────────┐
        │              Azure Virtual Network           │
        │                  10.0.0.0/16                 │
        │                                              │
        │  🌐 Web       → 10.0.1.0/24                  │
        │  ⚙️ App       → 10.0.2.0/24                  │
        │  🗄️ Database  → 10.0.3.0/24                  │
        │  🔧 Management→ 10.0.4.0/24                  │
        │  🛡️ Bastion   → 10.0.5.0/26                  │
        └──────────────────────────────────────────────┘

                         │
                         ▼
                  ┌──────────────┐
                  │ NAT Gateway  │
                  └──────┬───────┘
                         │
                         ▼
                  🌍 Outbound Internet

        🔐 Azure Key Vault
        🛡️ Network Security Groups
        🧭 Route Tables
        💾 Managed Disks
        📦 Storage Account
        🖥️ Azure Bastion
```

------------------------------------------------------------------------

## 🧱 3-Tier Design

  Tier              Component             Purpose
  ----------------- --------------------- ----------------------------------
  🌐 Presentation   Frontend VM           Handles web/application requests
  ⚙️ Application    Backend VM            Runs application/business logic
  🗄️ Data           Database VM           Provides database workload
  ⚖️ Traffic        Azure Load Balancer   Distributes incoming traffic
  🛡️ Management     Azure Bastion         Secure administrative access
  🌐 Egress         NAT Gateway           Controlled outbound connectivity

------------------------------------------------------------------------

## 📦 Azure Resources

The project is structured to provision and manage the following Azure
resources:

-   ☁️ Resource Groups
-   🌐 Virtual Network
-   🧩 Subnets
-   🔐 Network Security Groups
-   🔌 Network Interfaces
-   🖥️ Linux Virtual Machines
-   ⚖️ Azure Load Balancer
-   ❤️ Load Balancer Health Probe
-   🔗 Load Balancer Backend Pool
-   🌍 Public IP Addresses
-   🛡️ Azure Bastion
-   🚪 NAT Gateway
-   🧭 Route Tables
-   🔑 Azure Key Vault
-   💾 Managed Disks
-   📦 Storage Account

------------------------------------------------------------------------

## 🧩 Terraform Module Architecture

The infrastructure follows a **reusable module-based architecture**.

``` text
Terraform-Azure-Enterprise-3-Tier-Landing-Zone/
│
├── 📄 main.tf
├── 📄 providers.tf
├── 📄 variables.tf
├── 📄 terraform.tfvars
├── 📄 .gitignore
├── 📄 .terraform.lock.hcl
│
└── 📁 modules/
    │
    ├── 📁 bastion/
    ├── 📁 key_vault/
    ├── 📁 load_balancer/
    ├── 📁 managed_disk/
    ├── 📁 nat_gateway/
    ├── 📁 network_interface/
    ├── 📁 nsg/
    ├── 📁 nsg_association/
    ├── 📁 public_ip/
    ├── 📁 resource_group/
    ├── 📁 route_table/
    ├── 📁 storage_account/
    ├── 📁 subnet/
    ├── 📁 virtual_machine/
    └── 📁 virtual_network/
```

### 💡 Why Modules?

Terraform modules provide:

-   ♻️ Reusability
-   🧹 Cleaner code
-   📦 Separation of concerns
-   📈 Easier scalability
-   🔧 Easier maintenance
-   🌍 Environment portability

------------------------------------------------------------------------

## 🔧 Technology Stack

  Technology            Purpose
  --------------------- ---------------------------------
  ☁️ Microsoft Azure    Cloud platform
  🟪 Terraform          Infrastructure as Code
  🐧 Ubuntu Linux       Virtual Machine OS
  🐙 GitHub             Source control
  🔄 Azure DevOps       Planned CI/CD automation
  🔐 Azure Key Vault    Secret management
  🌐 Azure Networking   Enterprise network architecture

------------------------------------------------------------------------

## 🛠️ Prerequisites

Before deploying this project, make sure you have:

-   ✅ An active Azure subscription
-   ✅ Azure CLI installed
-   ✅ Terraform installed
-   ✅ Git installed
-   ✅ An authenticated Azure CLI session

Check the tools:

``` bash
terraform version
az version
git --version
```

Authenticate with Azure:

``` bash
az login
```

Verify the active subscription:

``` bash
az account show
```

------------------------------------------------------------------------

## 🚀 Terraform Deployment

### 1️⃣ Clone the repository

``` bash
git clone https://github.com/Rudra11abhaysingh/Terraform-Azure-Enterprise-3-Tier-Landing-Zone.git
```

``` bash
cd Terraform-Azure-Enterprise-3-Tier-Landing-Zone
```

### 2️⃣ Initialize Terraform

``` bash
terraform init
```

### 3️⃣ Format the configuration

``` bash
terraform fmt -recursive
```

### 4️⃣ Validate the configuration

``` bash
terraform validate
```

Expected result:

``` text
Success! The configuration is valid.
```

### 5️⃣ Review the execution plan

``` bash
terraform plan
```

### 6️⃣ Deploy the infrastructure

``` bash
terraform apply
```

Review the proposed changes and confirm with:

``` text
yes
```

### 7️⃣ Destroy the environment

⚠️ Use this only when you intentionally want to remove the deployed
infrastructure.

``` bash
terraform destroy
```

------------------------------------------------------------------------

## 🔐 Security Practices

This project follows important IaC security practices:

-   🚫 Do not commit `terraform.tfstate`
-   🚫 Do not commit `.terraform/`
-   🚫 Do not hard-code passwords or secrets
-   🔑 Use Azure Key Vault for sensitive values
-   🛡️ Use NSGs for network segmentation
-   🔒 Prefer private connectivity for internal tiers
-   🧹 Keep credentials outside source control
-   📋 Review Terraform plans before applying changes

### ⚠️ Important

Never commit sensitive files such as:

``` text
terraform.tfstate
terraform.tfstate.*
.terraform/
*.tfvars
*.tfvars.json
```

unless they contain no sensitive information and your repository policy
explicitly allows them.

For production environments, Terraform state should be stored in a
**secure remote backend**, such as Azure Storage with appropriate access
controls.

------------------------------------------------------------------------

## 🌿 Git Branching Strategy

Development follows a feature-branch workflow.

``` text
main
 │
 ├── feature/load-balancer
 ├── feature/nat-gateway
 ├── feature/bastion
 ├── feature/key-vault
 ├── feature/route-table
 └── feature/storage
```

Example:

``` bash
git switch -c feature/load-balancer
```

Stage changes:

``` bash
git add .
```

Commit:

``` bash
git commit -m "feat: add Azure Load Balancer backend pool and health probe"
```

Push:

``` bash
git push -u origin feature/load-balancer
```

------------------------------------------------------------------------

## 🔄 CI/CD Roadmap

The next stage of this project is to integrate Terraform with **Azure
DevOps CI/CD**.

Planned pipeline:

``` text
        👨‍💻 Developer
             │
             ▼
        🐙 GitHub
             │
             ▼
      🔄 Azure DevOps
             │
       ┌─────┴─────┐
       ▼           ▼
   Terraform    Security
     Checks       Checks
       │           │
       └─────┬─────┘
             ▼
      terraform plan
             │
             ▼
       👤 Approval
             │
             ▼
      terraform apply
             │
             ▼
       ☁️ Azure
```

### Planned pipeline stages

1.  🧹 Terraform Format
2.  ✅ Terraform Validate
3.  🔍 Security Scanning
4.  📋 Terraform Plan
5.  👤 Manual Approval
6.  🚀 Terraform Apply

Future security tooling can include:

-   🔎 Checkov
-   🛡️ tfsec
-   🧹 TFLint
-   🧪 Terratest
-   🔐 Secret scanning

------------------------------------------------------------------------

## 📊 Project Learning Objectives

This project is also designed as a practical learning environment for:

-   Terraform modules
-   Terraform variables and maps
-   `for_each`
-   Data sources
-   Resource dependencies
-   Azure networking
-   NSGs
-   Load Balancing
-   NAT Gateway
-   Bastion
-   Key Vault
-   Remote Terraform state
-   Git branching
-   CI/CD
-   Infrastructure security
-   Enterprise cloud architecture

------------------------------------------------------------------------

## 🗺️ Implementation Roadmap

### ✅ Completed

-   [x] Resource Groups
-   [x] Virtual Network
-   [x] Subnets
-   [x] Network Interfaces
-   [x] Network Security Groups
-   [x] 3-Tier VM architecture
-   [x] Public IP
-   [x] Azure Load Balancer
-   [x] Backend Pool
-   [x] Health Probe
-   [x] Load Balancer Rule
-   [x] GitHub repository

### 🚧 In Progress / Next

-   [ ] NAT Gateway
-   [ ] Azure Bastion
-   [ ] Key Vault
-   [ ] Route Table
-   [ ] Managed Disks
-   [ ] Storage Account
-   [ ] Remote Terraform Backend
-   [ ] Azure DevOps CI/CD Pipeline
-   [ ] Terraform Security Scanning
-   [ ] Automated Plan/Apply workflow

------------------------------------------------------------------------

## 🧠 Enterprise Architecture Principles

This project demonstrates the following cloud engineering principles:

> **Infrastructure as Code**\
> Everything should be reproducible and version controlled.

> **Modularity**\
> Infrastructure components should be reusable and independently
> maintainable.

> **Security by Design**\
> Network segmentation, secret management, and controlled access should
> be built into the architecture.

> **Automation First**\
> Manual infrastructure changes should be minimized.

> **GitOps Mindset**\
> Infrastructure changes should flow through version control and
> controlled deployment pipelines.

> **Least Privilege**\
> Access should be limited to what is required for each workload.

------------------------------------------------------------------------

## 📁 Environment Strategy

The architecture is designed to support multiple environments:

``` text
environments/
│
├── dev/
├── qa/
└── prod/
```

This allows the same Terraform modules to be reused while maintaining
environment-specific configuration.

------------------------------------------------------------------------

## 🏆 Project Outcome

By completing this project, the infrastructure demonstrates a practical
**Azure Cloud + Terraform + DevOps** workflow covering:

``` text
Azure Architecture
       +
Terraform IaC
       +
Modular Design
       +
Network Security
       +
3-Tier Application Architecture
       +
Git/GitHub
       +
CI/CD
       =
🚀 Enterprise Cloud Infrastructure
```

------------------------------------------------------------------------

## 👨‍💻 Author

**Abhay Singh**

Cloud & DevOps / Infrastructure Engineer

### Areas of Focus

☁️ Azure \| 🟪 Terraform \| 🔄 DevOps \| 🔐 DevSecOps \| 🌐 Networking
\| 🏗️ Cloud Architecture

------------------------------------------------------------------------

## ⭐ Support

If this project is useful for learning Terraform, Azure networking, or
enterprise cloud architecture, feel free to ⭐ the repository and
explore the implementation.

------------------------------------------------------------------------

### 📌 Disclaimer

This repository is intended for **learning, demonstration, and portfolio
purposes**. Review security, networking, identity, cost, and compliance
requirements before using the architecture in a production environment.
