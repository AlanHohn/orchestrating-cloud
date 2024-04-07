#!/bin/bash
aws cloudformation delete-stack --stack-name todo 
aws cloudformation wait stack-delete-complete --stack-name todo
