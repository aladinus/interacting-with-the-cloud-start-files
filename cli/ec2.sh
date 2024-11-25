#describe instances, it will display all instances and details
aws ec2 describe-instances


#describe instances, it will display instance-id only
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --output text


#create ec2 instance
aws ec2 run-instances \
  --image-id ami-0866a3c8686eaeeba \
  --instance-type t2.micro \
  --count 1 \
  --key-name vm-key \
  --security-group-ids REPLACE-SGID  \
  --subnet-id REPLACE-SUBNETID \
  --associate-public-ip-address \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=ec2-cli}]"


#delete ec2 instance
aws ec2 terminate-instances --instance-ids <instance-id> 