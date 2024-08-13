variable "application_name" {
  default = "hackney-app"
}

variable "cost_code" {
  default = "comms"
}

variable "product_team" {
  default = "outreach"
}

module "ec2" {
  source = "./.."

  application_name = var.application_name
  cost_code        = var.cost_code
  product_team     = var.product_team

  ami       = "ami-abcd1234"
  subnet_id = "subnet-1abc3454"
}

output "instance_id" {
    value = module.ec2.instance_id
}

output "instance_private_ip" {
    value = module.ec2.instance_private_ip
}
