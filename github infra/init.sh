#!/usr/bin/env bash

#----Common Function-----

print_usage() {
    echo "Usage: "
    echo "init.sh <project name> "
}

command_exists() {
    type "$1" &> /dev/null ;
}

if [[ $# -lt 1 ]];
then 
    print_usage
    exit 10
fi

export proj_name=$1

folder_path=./projects/${proj_name}
script_path=./scripts/modules

#cp ${script_path}/provider.tf ${folder_path}
#terraform init

TIMESTAMP=`date -u "+%Y%m%d%H%M%S%Z"`
export terraform_directory=../../projects/${proj_name}
export TF_DATA_DIR="${terraform_directory}/.terraform"
cp ${folder_path}/backend-${proj_name}.tf ${script_path}
echo "Initializing Terraform Code"
terraform -chdir=${script_path} init

#echo "$PWD"
#echo "${folder_path}"

terraform -chdir=${script_path} plan -var-file="../../${folder_path}/terraform.tfvars" > ${folder_path}/terraform-plan-${TIMESTAMP}.log
terraform -chdir=${script_path} plan -var-file="../../${folder_path}/terraform.tfvars"  -out "${terraform_directory}/terraform-plan-${TIMESTAMP}.out"

echo "Waiting...."
sleep 30

echo "Executing Terraform apply"


terraform -chdir=${script_path} apply "${terraform_directory}/terraform-plan-${TIMESTAMP}.out" > ${folder_path}/terraform-apply-${TIMESTAMP}.log

#terraform -chdir=${script_path} destroy -var-file="../../${folder_path}/terraform.tfvars" #"$PWD/terraform-plan-${TIMESTAMP}.out" > ${folder_path}/terraform-apply-${TIMESTAMP}.log




