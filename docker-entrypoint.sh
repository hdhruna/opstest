#!/bin/ash
#shellcheck shell=dash

#curl -s "${ECS_CONTAINER_METADATA_URI}"/task >es_task.json
#cat es_task.json

#export AWS_AZ=$(curl -s "${ECS_CONTAINER_METADATA_URI}"/task | jq -r '.AvailabilityZone')
AWS_AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
export AWS_AZ="${AWS_AZ:=FARGATE}"
# export AWS_AZ="${AWS_AZ}"
export date_api_host="${date_api_host:=time}"
export date_api_port="${date_api_port:=8081}"

/home/relay42/app/mvnw spring-boot:run

#java -Djava.security.egd=file:/dev/./urandom -Dspring.config.location=/home/celonis/app/.config/application.yml -jar /home/celonis/app/celonis.jar

# sleep 3600
