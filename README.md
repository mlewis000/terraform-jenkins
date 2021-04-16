# The following Instructions will install Jenkins on an newly created EC2 Rhel 8 instance and configure to run on port 8000, using Terraform/Puppet and AWS.
# You will be using my AWS account,  so i have provided some temporary keys, to add into your terraform setup.

# The following Assumes you have.
1. You have been provided with the .pem file (should be via email or link)
2. Macbook
3. Access to GitHUB - The REPO Needed is -  https://github.com/mlewis000/terraform-jenkins.git
4. Terraform is installed,  if not please follow the next step.

# Installation of Required Software on MAC.
1. Install terraform - https://learn.hashicorp.com/tutorials/terraform/install-cli

# The next Steps are to setup Terraform to Access AWS and Set the Build off.

# Clone Repo form GitHUB
# STEP 1.
'''
mkdir ~/terraform
cd ~/terraform/
git clone https://github.com/mlewis000/terraform-jenkins.git
cd terraform-jenkins
'''

# Now setup terraform to login to your AWS account.
# Copy the .pem provided in the email/link to your home directory and change permissions
# Also Edit terraform.tfvars provided in the puppet_terraform_keys.txt email. This tells Terraform where to look fo ryour credentials to AWS.
# STEP 2.
'''
cp temp_key_pair.pem ~/
chmod 400 ~/temp_key_pair.pem
cp puppet_terraform_keys.txt terraform.tfvars
'''

# Now Deploy the AWS Infra VIA Terraform.
# This part will also install the puppet-agent via a terraform provisioner and a script will install the jenkins module from Puppet Forge.
# The class jenkins will be imported and site.pp copied into place to change the Jenkins port to 8000.
# STEP 3.
'''
cd ~/terraform/terraform-jenkins
terraform init
terraform validate
terraform plan --out jenkins.tfplan
terraform apply "jenkins.tfplan"
'''


# No log on to jenkins via the browser.
# Make a note of the ouputs of the external DNS name of teh EC2 RHEL 8 server and paste into your browser.
# STEP 4.  - OUTPUT IS SIMILAR TO BELOW.

State path: terraform.tfstate

Outputs:

aws_instance_public_dns = "ec2-18-130-216-218.eu-west-2.compute.amazonaws.com"

# Now in your browser copy "ec2-18-130-216-218.eu-west-2.compute.amazonaws.com" or equivalent on the run into a browser, as in below.
'''
http://ec2-18-130-216-218.eu-west-2.compute.amazonaws.com:8000
'''

# Once happy please destroy setup
# STEP 5.
'''
terraform destroy
'''

# Please let me know once complete, I will remove all keys.


