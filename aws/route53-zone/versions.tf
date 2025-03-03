terraform {
    required_version = ">= v0.15.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 4.20.0"
        }
    }
}