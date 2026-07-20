# Terraform Associate Preparation - Day 5

**Date:** 20 July 2026

---

# Topics Covered

- Terraform Expressions
- Types and Values
- Primitive Types
- Null Type
- Collection Types
- Strings and String Templates
- HEREDOC
- String Interpolation
- String Directives
- Operators
- Conditional Expressions
- For Expressions
- Splat Expressions
- Dynamic Blocks
- Implicit Element Ordering
- Semantic Versioning
- Version Constraints
- Progressive Versioning

---

# Notes

## Terraform Expressions

Terraform expressions are used to calculate, manipulate and generate values dynamically.

Examples:
- String interpolation
- Conditional expressions
- Mathematical operations
- Loops
- Function calls

---

# Types and Values

Every value in Terraform belongs to a specific data type.

## Primitive Types

- String
- Number
- Boolean

Example

```hcl
name    = "Tomcat"
port    = 8080
enabled = true
```

---

## Null Type

```hcl
endpoint = null
```

### Important

`null` **does not mean empty**.

It means:

> Terraform omits the argument completely and lets the provider use its default behavior (if available).

Example

```hcl
key_name = null
```

Terraform behaves as if `key_name` was never written.

### Easy Memory

**Null = No Value = Omit Argument**

---

## Collection Types

### List

```hcl
[
  "Apple",
  "Banana",
  "Mango"
]
```

### Map

```hcl
{
  name = "Tomcat"
  port = 8080
}
```

Remember:

- `[]` → List
- `{}` → Map/Object (when used as a value)

---

# Strings and String Templates

## Normal String

```hcl
"Hello Terraform"
```

---

## HEREDOC

Used for multiline strings.

```hcl
<<EOT
Hello
Welcome
Terraform
EOT
```

Useful for:
- Shell scripts
- Configuration files
- Large text blocks

---

## String Interpolation

Syntax

```hcl
${expression}
```

Example

```hcl
"${var.environment}-server"
```

If

```hcl
environment = "prod"
```

Output

```
prod-server
```

### Easy Memory

`${}`

↓

Insert a dynamic value inside a string.

---

## String Directives

Used for conditions and loops inside multiline strings.

Syntax

```hcl
%{ if }
%{ for }
```

Understand the purpose.

Do not memorize the syntax.

---

# Operators

### Arithmetic

```
+
-
*
/
%
```

### Comparison

```
==
!=
<
>
<=
>=
```

### Logical

```
&&
||
!
```

---

# Conditional Expressions

Terraform uses the ternary operator.

Syntax

```hcl
condition ? true_value : false_value
```

Example

```hcl
var.environment == "prod" ? "t3.large" : "t3.micro"
```

### Important

Both return values should be of the same data type.

Example

```hcl
tostring(5)
```

converts a number into a string.

---

# For Expressions

Purpose:

Iterate over a collection and transform every element.

General Syntax

```hcl
[for item in collection : expression]
```

Example

```hcl
[for s in var.list : upper(s)]
```

Input

```
["apple","banana","mango"]
```

Output

```
["APPLE","BANANA","MANGO"]
```

### Easy Way to Read

```
Take every item

↓

Apply the expression

↓

Return the new collection
```

---

## List with Index

```hcl
[for i, v in var.list : "${i} is ${v}"]
```

Result

```
0 is Tomcat
1 is Jenkins
2 is Grafana
```

---

## Map

```hcl
for k, v in var.map
```

k → Key

v → Value

---

# Splat Expressions

Purpose:

Shortcut for a simple for expression.

Instead of

```hcl
[for vm in aws_instance.web : vm.public_ip]
```

write

```hcl
aws_instance.web[*].public_ip
```

### Easy Memory

`[*]`

↓

**For Every Item**

Read

```hcl
aws_instance.web[*].public_ip
```

as

> Get the public IP of every EC2 instance.

---

# Dynamic Blocks

### Definition

Automatically generate repeated nested blocks inside a resource.

Instead of

```hcl
ingress {}

ingress {}

ingress {}
```

Terraform generates them automatically.

### Difference

| Feature | Repeats |
|----------|----------|
| `for_each` | Resources |
| `dynamic` | Nested Blocks |

### Easy Memory

**Dynamic Block = Repeat Nested Blocks**

---

# Implicit Element Ordering

Terraform sometimes converts unordered collections into ordered collections.

Rules:

- Maps & Objects → Ordered by key (A-Z)
- Sets of Strings → Alphabetically
- Everything Else → Arbitrary order

No need to memorize the rules.

Just understand why ordering is required.

---

# Semantic Versioning

Terraform follows

```
MAJOR.MINOR.PATCH
```

### Patch

Bug Fix

Example

```
2.5.8 → 2.5.9
```

---

### Minor

New Feature

Example

```
2.5.8 → 2.6.0
```

---

### Major

Breaking Changes

Example

```
2.5.8 → 3.0.0
```

### Easy Memory

```
Patch → Bug Fix

Minor → New Feature

Major → Breaking Change
```

---

# Version Constraints

Purpose

Prevent Terraform from automatically downloading incompatible versions.

Examples

```hcl
= 5.2.0
```

Exact version.

---

```hcl
>= 5.2.0
```

Version 5.2.0 or newer.

---

```hcl
!= 5.2.3
```

Everything except one version.

---

```hcl
~> 5.2
```

Allow compatible updates while avoiding unexpected major-version upgrades.

---

# Progressive Versioning

Meaning

Keep software updated regularly with small updates instead of performing one huge upgrade after several years.

Benefits

- Easier upgrades
- Better compatibility
- Better security
- Easier debugging

---

# Terraform Commands Practiced

## terraform fmt

Formats Terraform code according to HashiCorp's standard style.

---

## terraform validate

Checks whether the Terraform configuration is valid.

It does **NOT** create infrastructure.

---

## terraform plan

Evaluates the configuration and shows what Terraform would do.

---

# Hands-on Notes

### Practical Issue Faced

Error

```
Error: No configuration files
```

Cause

Ran Terraform from the wrong directory.

Solution

Navigate to the folder containing the `.tf` files before running Terraform commands.

---

# Concepts That Needed Extra Attention Today

### Null

Remember:

> Null means **omit the argument**, not empty.

---

### Variables vs Locals vs Outputs (Revision)

Variables

→ Input from the user.

Locals

→ Internal helper values calculated by Terraform.

Outputs

→ Values returned after Terraform evaluates or creates infrastructure.

---

### String Interpolation

```
${}
```

Insert dynamic values inside strings.

---

### For Expressions

Read

```hcl
[for s in var.list : upper(s)]
```

as

```
Take every item

↓

Convert to uppercase

↓

Return the new collection
```

---

### Splat Expressions

Read

```hcl
aws_instance.web[*].public_ip
```

as

```
Get the public IP of every EC2 instance.
```

---

### Dynamic Blocks

Do **not** memorize the syntax.

Remember only:

> Dynamic blocks generate repeated nested blocks inside a resource.

---

# Day 5 Summary

Today was the first day focused on the Terraform language itself rather than high-level concepts. We covered Terraform expressions, data types, string templates, operators, conditional expressions, loops, splat expressions, dynamic blocks, semantic versioning, version constraints, and progressive versioning. The main focus was understanding **why** each feature exists instead of memorizing syntax. Hands-on practice included using `terraform fmt`, `terraform validate`, and `terraform plan`, along with debugging a common issue caused by running Terraform from the wrong directory.