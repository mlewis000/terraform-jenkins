# This is a single rhel node deployed via terraform.

EC2 is created and deployed to the default VPC
Security Groups are created and Assigned to EC2
EC2 is updated and jenkins is installed
Jenkins is configured to run on port 8000
The external dns of the server is outputted
the password for the admin password of the jenkins server is provided

# Clone Repo form GitHUB
'''
mkdir ~/terraform
cd ~/terraform/
git clone https://github.com/mlewis000/terraform-aws-deploy.git
cd terraform-jenkins
'''

# Now setup terraform login to your AWS account.
# Copy the .pem provided in the email to your home directory and change permissions
# Also Edit terraform.tfvars provided in the puppet_terraform_keys.txt email.
'''
1. Copy the .pem provided in the email to your home directory and change permissions
chmod 400 ~/temp_key_pair.pem
cp puppet_terraform_keys.txt terraform.tfvars
'''

# Now Deploy the AWS Infra VIA Terraform
'''
cd ~/terraform/terraform-jenkins
terraform init
terraform validate
terraform plan -out jenkins.tfplan
terraform apply "jenkins.tfplan"
'''


# Upon completion the following will be displayed.  Copy the output in this instance below:

State path: terraform.tfstate

Outputs:

aws_instance_public_dns = "ec2-18-130-216-218.eu-west-2.compute.amazonaws.com"


# So now paste the aws_instance_public_dns output in your browser and append :0000 as thats port its configured on. OR
'''
curl http://ec2-18-130-216-218.eu-west-2.compute.amazonaws.com:8000
'''

# If you want to login and configure Jenkins before the complete message the Admin password is outputted.
aws_instance.puppet (remote-exec): Complete!
aws_instance.puppet (remote-exec): Jenkins Admin Password is :
aws_instance.puppet (remote-exec): 08085219de447bab2

# Now use 08085219de447bab2 (wont be the same as this sample) to login, via the browser.

# Once happy please destroy setup
terraform destroy


