#!/bin/ash
#shellcheck shell=dash

export AWS_AZ=$(curl -s -q http://169.254.169.254/latest/meta-data/placement/availability-zone)

export AWS_AZ="${AWS_AZ}"
export date_api_host="${date_api_host}"
export date_api_port="${date_api_port}"

/home/relay42/app/mvnw spring-boot:run

#java -Djava.security.egd=file:/dev/./urandom -Dspring.config.location=/home/celonis/app/.config/application.yml -jar /home/celonis/app/celonis.jar


# sleep 3600