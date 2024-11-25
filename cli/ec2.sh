#describe instances, it will display all instances and details
aws ec2 describe-instances


#describe instances, it will display instance-id only
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --output text


#create ec2 instance
aws ec2 run-instances \
  --image-id ami-0abcd1234efgh5678 \
  --instance-type t2.micro \
  --count 1 \
  --key-name vm-key \
  --security-group-ids SGID  \
  --subnet-id SUBNET  \
  --associate-public-ip-address \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=ec2-cli}]"


#delete ec2 instance
aws ec2 terminate-instances --instance-ids <instance-id> 

