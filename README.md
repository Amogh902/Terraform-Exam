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