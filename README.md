# README 

A terraform recipe for spinning up AWS ec2 and printing out the ssh command.

To use this example you need:

    - [Terraform](https://www.terraform.io/) installed
    - An AWS account, and credentials in your ~/.aws/credentials
    - Edit the file `terraec2.tf` to put your own public key in there. 

```
# clone repo
git clone git@github.com:jakevc/terraec2-.git
cd terraec2-

# edit terraec2, adding your public_key in place of ~/.ssh/id_rsa.pub

# run terraform
terraform init
terraform plan
terraform apply -auto-approve
```

When you are all done, and need to remove the resources:

```
terraform destroy
```


