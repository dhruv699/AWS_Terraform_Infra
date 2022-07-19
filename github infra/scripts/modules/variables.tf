variable "region" {
  description = "us-east-1"
}

variable "environment" {
  description = "The Deployment environment"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
        type = string
        description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
        type = string
        description = "The CIDR block for the private subnet"
}

variable "ami_id_pub" {
        type        = string
        default     = ""        
}

variable "ami_id_pri" {
        type        = string
        default     = ""        
}


variable "ins_type" {
        type = string
        default = ""
}

variable "pem_key1" {
        type        = string
        default     = ""        
}
variable "pem_key2" {
        type        = string
        default     = ""        
}


variable "pub_subnet_id" {
        type = string
        default = ""
}
variable "pri_subnet_id" {
        type = string
        default = ""
}
variable "sg_id" {
  type = string
  default = ""
}

variable "sg_private_id" {
  type = string
  default = ""
}



variable "public_subnets_id" {
        type = string
        default = ""
}
variable "private_subnets_id" {
        type = string
        default = ""
}
