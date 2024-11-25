#list s3 buckets
aws s3 ls 

#list bucket contents recursively
aws s3 ls s3://BUCKETNAME --recursive

#create an s3 bucket
aws s3api create-bucket --bucket BUCKETNAME

#delete an s3 bucket
aws s3api delete-bucket --bucket BUCKETNAME