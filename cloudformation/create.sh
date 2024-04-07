#!/bin/bash
aws cloudformation delete-stack --stack-name todo 
aws cloudformation wait stack-delete-complete --stack-name todo
aws cloudformation deploy --capabilities CAPABILITY_IAM --template-file todo.yaml --stack-name todo
ip=$(aws cloudformation describe-stacks --stack-name todo --query 'Stacks[0].Outputs[?OutputKey==`TodoIp`].OutputValue' --output text)
echo "Once the Todo application is deployed, access it at http://${ip}:5000/"
