locals {
  city = "Pune"
  age = "24"
  is_learning = true


fruits = [
    "Apple",
    "Banana",
    "Mango"
  ]

  server = {
    name = "Tomcat"
    port = 8080
  }

  optional_value = null
}


variable "environment" {
  default = "dev"
}

locals {
  server_name = "${var.environment}-tomcat-server"
}

output "server_name" {
  value = local.server_name
}

######################################################
            # Dynamic Blocks #
######################################################

# Instead of this we can 

/*
 ingress {
  from_port = 80
}

ingress {
  from_port = 443
}

ingress {
  from_port = 8080
}

*/

variable "ports" {
  default = [80, 443, 8080]
}

/*dynamic "ingress" {
  for_each = var.ports

  content {
    from_port = ingress.value
    to_port   = ingress.value
  }
}
*/