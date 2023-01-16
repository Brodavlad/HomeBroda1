#!/bin/bash


aws s3api create-bucket --bucket broda.bucket.lab1 --region us-east-1

aws s3api put-bucket-policy --bucket broda.bucket.lab1 --policy file://bucket_policy.json         

aws s3 sync ./ s3://broda.bucket.lab1/                                                             

aws s3 website s3://broda.bucket.lab1/ --index-document index.html --error-document error.html

aws s3 presign s3://broda.bucket.lab1/index.html
aws s3 presign s3://broda.bucket.lab1/error.html

## update (small) pause to have enough time to check url`s
sleep 30
