#!/bin/bash
blackbox_postdeploy

terraform remote config -backend=s3 -backend-config="bucket=csd-terraform"\
  -backend-config="key=terraform.tfstate" -backend-config="region=eu-west-1"
terraform apply
