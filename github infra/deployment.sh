#!/usr/bin/env bash

#----Common Function-----

print_usage() {
    echo "Usage: "
    echo "deployment.sh <project name> "
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

export folder_path=./projects/${proj_name}
export script_path=./scripts

template_path=./scripts/template

#Project Configuration

mkdir -p ${folder_path}
export backend_path=../../projects/${proj_name}
cp ${template_path}/*.tfvars ${folder_path}
BACKEND_FILE=backend-${proj_name}.tf
envsubst < ${template_path}/backend.tf.template > ${folder_path}/${BACKEND_FILE}
