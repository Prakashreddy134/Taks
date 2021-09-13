variable "region" {
    type = string
    default = "us-central"
}

variable "project" {
    type = string
}

variable "user" {
    type = string
}

variable "privatekeypath" {
    type = string
    default = "~/.ssh/id_rsa"
}

variable "publickeypath" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}

variable "firewall_name" {
    type = string
}

variable "network" {
    type = string
}


variable "instance_name" {
    type = string
}


variable "machine_type" {
    type = string
}

variable "zone" {
    type = string
}


variable "os_image" {
    type = string
}


variable "protocol" {
    type = string
}

variable "serviceaccountjson"{
 type = string 
 default = "~/test.json"
}
