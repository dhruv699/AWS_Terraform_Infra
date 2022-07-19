

variable "ami_id_pub" {
        type        = string
        default     = ""        
}

variable "ami_id_pri" {
        type        = string
        default     = ""        
}


variable "instance_type" {
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
  type = list(string)
  default = []
}
variable "sg_private_id" {
  type = list(string)
  default = []
}