repository_name=AZCloud# Your repository name
repository_description=$repository_name   # Or more descriptive
region=us-east-1

repository_endpoint=$(aws codecommit get-repository --region "$region" --repository-name "$repository_name" --output text --query 'repositoryMetadata.cloneUrlHttp')
echo repository_endpoint=$repository_endpoint

profile=$AWS_DEFAULT_PROFILE   # Or your aws-cli profile name

git clone --config 'credential.helper=!aws codecommit --profile '$profile' --region '$region' credential-helper $@' --config 'credential.UseHttpPath=true' $repository_endpoint
cd $repository_name


git config --global credential.helper '!aws --profile pijush__kanti_biswas codecommit credential-helper $@'