variable "application_name" {
  type = string
}

variable "cost_code" {
  type = string
}

variable "product_team" {
  type = string
}

variable "root_volume_size" {
  type    = number
  default = 80

  validation {
    condition     = var.root_volume_size < 100
    error_message = "Root volume max size is 100GB"
  }
}

variable "ebs_volume_size" {
  type    = number
  default = 80

  validation {
    condition     = var.ebs_volume_size < 100 && var.ebs_volume_size > 50
    error_message = "EBS volume size must be between 50GB and 100GB"
  }
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
      condition = contains(["t3.micro", "t3.small"], var.instance_type)
      error_message = "Only t3.micro and small instance types are allowed" 
  }
}

variable "ami" {
  type = string
}

variable "subnet_id" {
  type = string
}
