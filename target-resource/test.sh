#!/bin/bash
resources=(
  "aws_s3_bucket.s3-buc"
  "aws_instance.ec2"
)

for resource in "${resources[@]}"; do
  targets+=" -target=$resource"
done

terraform apply $targets
