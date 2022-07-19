
print_usage() {
    echo "Usage: "
    echo "destroy.sh <project name> "
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
TIMESTAMP=`date -u "+%Y%m%d%H%M%S%Z"`
cp ${folder_path}/backend-${proj_name}.tf ${script_path}
export terraform_directory=../../projects/${proj_name}
export TF_DATA_DIR="${terraform_directory}/.terraform"

terraform -chdir=${script_path} init
terraform -chdir=${script_path} destroy --auto-approve -var-file="../../${folder_path}/terraform.tfvars" > ${folder_path}/terraform-destroy-${TIMESTAMP}.log


EOF