#!/bin/bash
keyId=$(aws ec2 describe-key-pairs --filters Name=key-name,Values=TodoKey --query 'KeyPairs[*].KeyPairId' --output text)
aws ssm get-parameter --name /ec2/keypair/${keyId} --with-decryption --query Parameter.Value --output text > todo-key.pem
chmod 0600 todo-key.pem
ip=$(aws cloudformation describe-stacks --stack-name todo --query 'Stacks[0].Outputs[?OutputKey==`TodoIp`].OutputValue' --output text)
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i todo-key.pem ec2-user@${ip}
