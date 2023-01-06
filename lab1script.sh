#!/bin/bash

aws s3 mb s3://broda.bucket
aws s3api put-bucket-policy --bucket broda.bucket --policy file://bucket_policy.json 
aws s3 sync D://html.aws s3://broda.bucket
aws s3 website s3://broda.bucket/ --index-document index.html --error-document error.html
aws s3 presign s3://broda.bucket/index.html
aws s3 presign s3://broda.bucket/error.html
