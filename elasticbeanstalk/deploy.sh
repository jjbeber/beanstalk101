#!/bin/bash

# Global vars
environment="$1"
region="$2"
application="beanstalk101"
web_environment="${application}-web"

set_configuration_files(){
    docker_config="Dockerrun.aws.json"
    beanstalk_config=".elasticbeanstalk/config.yml"

    sed \
        -e "s/WEB-ENVIRONMENT/$web_environment/g" \
        -e "s/REGION/$region/g" \
        $beanstalk_config.template | tee $beanstalk_config
    sed \
        -e "s/TAG_VERSION/$CIRCLE_SHA1/g" \
        $docker_config.template | tee $docker_config
}

deploy_web_env(){
    eb deploy  \
        $web_environment \
        -l $CIRCLE_SHA1 || exit 1
}

set_configuration_files
deploy_web_env
