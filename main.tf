terraform {
       backend "remote" {
         # The name of your Terraform Cloud organization.
        organization = "testGmbH"

         # The name of the Terraform Cloud workspace to store Terraform state files in.
         workspaces {
           name = "TestDeployment"
         }
       }
     }

     provider "aws" {
        profile = "default"
        region  = "eu-central-1"
      }

resource "aws_instance" "example" {
  ami           = "ami-00224432b596f1c45"
  instance_type = "t2.micro"
