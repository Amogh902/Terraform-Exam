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