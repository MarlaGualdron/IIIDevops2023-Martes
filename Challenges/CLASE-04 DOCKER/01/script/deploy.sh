#!/bin/bash


docker run --name=db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret-pw -d mysql:8

docker run --name=my-admin -p 82:80 --link db:db -d phpmyadmin

docker ps 
