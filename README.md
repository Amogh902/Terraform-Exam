# Terraform Learning Journey

## Goal
Become proficient in Terraform, pass the HashiCorp Terraform Associate Certification, and gain production-level Infrastructure as Code (IaC) skills.

---

# Day 1 (13 July 2026)

## Topics Covered
- Installed Terraform v1.15.8
- Configured PATH environment variable
- Set up Terraform development environment
- Selected learning resources

## Key Takeaways
- Completed Terraform installation successfully.
- Decided not to wait for an AWS account before starting.
- Chose Andrew Brown's course as the primary learning resource.
- Learning will begin with Terraform fundamentals before moving to AWS resources.

---

# Day 2 (14 July 2026)

## Topics Covered
- Infrastructure as Code (IaC)
- Declarative vs Imperative
- Provisioning vs Deployment
- APIs
- Configuration Drift
- Mutable vs Immutable Infrastructure
- GitOps
- HashiCorp Ecosystem

## Key Takeaways
- IaC allows infrastructure to be managed through code instead of manual configuration.
- Terraform is declarative: we define the desired state rather than the implementation steps.
- Provisioning creates infrastructure; deployment installs or updates applications on existing infrastructure.
- APIs enable Terraform to communicate with cloud providers such as AWS.
- AWS creates resources; Terraform sends API requests to AWS services.
- Configuration drift occurs when infrastructure is changed outside of Terraform.
- Immutable infrastructure replaces existing servers instead of modifying them, reducing configuration drift.
- GitOps uses Git as the single source of truth for Infrastructure as Code.
- Learned the purpose of the major HashiCorp tools and how they complement Terraform.

# Day 3 (16 July 2026)

## Topics Covered
- What is Terraform
- Features of Terraform
- Terraform Cloud
- Terraform Lifecycle
- Change Management
- Change Automation
- Execution Plans
- Resource Graph
- Visualizing Resource Graph using `terraform graph` and Graphviz
- Terraform Use Cases
- Terraform Core
- Terraform Plugins
- Recommended Learning Resources

## Key Takeaways

- Terraform is an Infrastructure as Code (IaC) tool that provisions and manages infrastructure using a declarative approach.

- Terraform Cloud provides remote state management, team collaboration, and centralized Terraform execution.

- The Terraform lifecycle consists of:
  1. Write Terraform configuration
  2. `terraform init`
  3. `terraform validate`
  4. `terraform plan`
  5. `terraform apply`
  6. `terraform destroy`

- **Change Management** is the process of planning, reviewing, approving, implementing, and tracking infrastructure changes before they are applied.

- **Change Automation** means Terraform automates infrastructure changes in a predictable, repeatable, and consistent manner instead of relying on manual modifications.

- Terraform achieves Change Automation through the following workflow:

```text
Write Terraform Code
        │
        ▼
terraform validate
        │
        ▼
terraform plan
(Execution Plan)
        │
        ▼
Terraform builds a Resource Graph
        │
        ▼
Shows all proposed infrastructure changes
        │
        ▼
Review & Approval
        │
        ▼
terraform apply
```

- **Execution Plan (`terraform plan`)**
  - Compares the Terraform configuration, Terraform state, and the actual infrastructure.
  - Displays exactly what Terraform will create, modify, or destroy before making any changes.
  - Allows teams to safely review infrastructure changes.

- **Resource Graph**
  - Terraform automatically builds a dependency graph between resources.
  - Resources are created based on dependencies, **not** the order in which they appear in the `.tf` file.
  - Example:
    ```
    VPC
      │
      ▼
    Subnet
      │
      ▼
    EC2
    ```

- `terraform graph` generates the dependency graph, which can be visualized using **Graphviz**.

- **Terraform Use Cases**
  - Provision infrastructure across AWS, Azure, GCP, and many other providers.
  - Manage large multi-tier applications by organizing infrastructure into reusable modules.
  - Create disposable development or testing environments using `terraform apply` and remove them using `terraform destroy`.
  - Provision infrastructure for platforms beyond traditional cloud providers through Terraform providers.
  - Manage infrastructure across multiple cloud providers using a single Terraform configuration (Multi-Cloud Deployment).

- **Terraform Core**
  - The main Terraform engine.
  - Reads Terraform configuration.
  - Builds the execution plan.
  - Creates the resource graph.
  - Maintains the Terraform state.
  - Communicates with providers.

- **Terraform Plugins (Providers)**
  - Extend Terraform's capabilities.
  - Enable Terraform to communicate with external platforms through their APIs.
  - Examples include AWS, Azure, Google Cloud, Kubernetes, GitHub, Docker, Cloudflare, and many others.

- Recommended learning resources:
  - **Terraform Up & Running** (book) for in-depth Terraform knowledge.
  - **Terraform Best Practices** (free online e-book) for production-level guidance.

# Terraform Learning Journey

# Day 4

## Topics Covered
- Terraform Provisioners
- Local Exec Provisioner
- Remote Exec Provisioner
- File Provisioner
- Connection Block
- Null Resource
- Data Sources
- Providers
- Terraform Registry
- Provider Aliases
- HashiCorp Configuration Language (HCL)
- Terraform Configuration Files
- Input Variables
- Variable Loading Hierarchy
- Output Values
- Local Values
- Named Values
- Resource Meta Arguments
- Resource Behaviour
- Count vs For_Each

---

# Key Takeaways

## 1. Terraform Provisioners
- Provisioners should be the **last resort**.
- Terraform's primary responsibility is provisioning infrastructure, not configuring it.
- Configuration management should be handled by tools like **Ansible**, **Puppet**, or **Chef**.

### Practical Example
Terraform:
- Create EC2
- Create Security Group
- Create VPC

Ansible:
- Install Java
- Install Tomcat
- Configure server.xml
- Create systemd service
- Configure applications

---

## 2. Local Exec

Runs commands on the machine where Terraform is executed.

Example:
- Create a local text file
- Write the created EC2 private IP into a file
- Execute PowerShell or Bash commands locally

---

## 3. Remote Exec

Runs commands on the remote resource after it has been created.

Example:
- Install packages
- Restart services
- Run initialization commands

---

## 4. File Provisioner

Copies files from your local machine to the created resource.

Example:
- Copy configuration files
- Copy shell scripts
- Copy application files

---

## 5. Connection Block

Defines how Terraform connects to a remote machine.

Usually contains:
- SSH username
- Private key
- Host IP

---

## 6. Null Resource

A resource that doesn't create infrastructure.

Used only to execute provisioners or trigger custom tasks.

Example:
- Execute scripts
- Trigger local commands
- Perform automation steps

---

# 7. Data Sources

## Golden Rule

Resource = Create

Data Source = Read Existing Infrastructure

Example:
Instead of creating a new AMI, VPC, or Security Group, Terraform searches AWS for an existing one and uses it.

Flow:

Terraform

↓

Search AWS

↓

Apply Filters

↓

Return Matching Resource

↓

Use that Resource

Example:

data.aws_ami.web.id

returns the ID of an already existing AMI.

---

# 8. Providers

Provider = Plugin that allows Terraform to communicate with a platform.

Examples:
- AWS
- Azure
- Google Cloud
- GitHub
- Kubernetes

Without a provider Terraform has nowhere to create infrastructure.

---

## Provider Alias

Used when multiple configurations of the same provider are required.

Example:
- AWS Mumbai
- AWS Singapore

Terraform can select the required provider using an alias.

---

# 9. Providers vs Modules

## Provider

Responsible for communicating with cloud platforms.

Example:
AWS Provider

↓

Creates EC2

Creates VPC

Creates S3

---

## Module

Reusable block of Terraform code.

Exactly like a function in programming.

Instead of writing the same configuration repeatedly, write it once and reuse it.

---

# 10. HashiCorp Configuration Language (HCL)

Terraform configuration files are written in HCL.

Extensions:
- .tf
- .tf.json

Main building blocks:

- Blocks
- Arguments
- Expressions

---

# 11. Input Variables

Purpose:
Receive values from outside Terraform.

Common arguments:
- type
- default
- description
- validation
- sensitive

---

# 12. Variable Loading Priority

Lowest Priority

Default

↓

Environment Variables (TF_VAR_)

↓

terraform.tfvars

↓

*.auto.tfvars

↓

-var-file

↓

-var

Highest Priority

Rule:
The higher priority source overrides all lower priority values.

---

# 13. Output Values

Outputs display information after infrastructure creation.

Example:
- Public IP
- DNS Name
- Instance ID

Useful commands:

terraform output

terraform output <name>

terraform output -json

terraform output -raw

Important:

sensitive = true

only hides values from the terminal.

Sensitive values are still stored in plain text inside the Terraform State File.

---

# 14. Local Values

## Variable

Value supplied by the user.

Example:
Environment
Instance Type
AWS Region

---

## Local

Value calculated or reused inside Terraform.

Example:

Environment = Production

↓

Terraform calculates

↓

Production-Tomcat-Server

Rule:

Ask yourself:

Should the user decide this value?

YES → Variable

NO → Local

Variables = External Inputs

Locals = Internal Calculations

---

# 15. Named Values

Named Values are simply references used to access existing values.

Examples:

Variables

var.instance_type

Locals

local.server_name

Data Sources

data.aws_ami.web.id

Resources

aws_instance.web.public_ip

Modules

module.vpc

Self

self.private_ip

Remember:

Named Values are only references.

They do not create anything.

---

# 16. Resource Meta Arguments

Meta Arguments modify Terraform's behaviour instead of modifying the resource itself.

depends_on

Controls creation order.

count

Creates multiple identical resources.

for_each

Creates multiple resources using unique values.

provider

Selects a different provider configuration.

lifecycle

Customizes resource lifecycle.

provisioner

Runs additional actions after resource creation.

connection

Defines how Terraform connects to remote resources.

---

# 17. Count vs For_Each

## Count

Best when resources are almost identical.

Example:

count = 3

Creates:

EC2-1

EC2-2

EC2-3

---

## For_Each

Best when every resource has its own identity.

Example:

Tomcat

Jenkins

Grafana

Each resource has different values.

---

## Understanding each.key and each.value

### Using a Map

Example:

Tomcat → Mumbai

Jenkins → Singapore

Iteration 1

each.key = Tomcat

each.value = Mumbai

Iteration 2

each.key = Jenkins

each.value = Singapore

Meaning:

each.key = Resource Name

each.value = Resource Property

---

### Using a Set (toset)

Example:

Todd

James

Alice

Dottie

Terraform internally loops through every value.

Iteration:

each.key = Todd

↓

Create IAM User Todd

Next:

each.key = James

↓

Create IAM User James

When using a Set:

each.key represents the current value.

---

Rule:

Count → Multiple identical resources

For_Each → Multiple unique resources

---

# 18. Resource Behaviour

Terraform compares:

- Configuration
- State File
- Real Infrastructure

Possible actions:

+ Create

Resource doesn't exist.

- Destroy

Removed from configuration.

~ Update In-Place

Modify existing resource.

-/+ Replace

Destroy old resource and create a new one because the change cannot be performed in place.