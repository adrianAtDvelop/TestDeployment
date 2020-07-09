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
        version = "2.69.0"
        region  = "eu-central-1"
      }

resource "aws_instance" "example" {
  ami           = "ami-00224432b596f1c45"
  instance_type = "t2.micro"
       }

resource "aws_elastic_beanstalk_application" "test" {
    name = "testapp"
    description = "tf-test-desc"
}

resource "aws_elastic_beanstalk_environment" "testenv" {
    name = "testenv"
    application = "aws_elastic_beanstalk_application.testapp.name"
    solution_stack_name = "64bit Windows Server Core 2019 v2.5.7 running IIS 10.0"

}
