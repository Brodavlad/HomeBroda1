#!/bin/bash

aws s3api create-bucket --bucket broda.bucket --region us-east-1                              

aws s3api put-bucket-policy --bucket broda.bucket --policy file://policy_s3.json         

aws s3 sync ./ s3://broda.bucket/                                                             

aws s3 website s3://broda.bucket/ --index-document index.html --error-document error.html

aws s3 presign s3://broda.bucket/index.html
aws s3 presign s3://broda.bucket/error.html

## update (small) pause to have enough time to check url`s
sleep 30
