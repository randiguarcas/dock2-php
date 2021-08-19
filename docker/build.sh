#!/bin/bash
set -x
while getopts "bslnd:" opt; do
    case ${opt} in
        b) sudo docker-compose up ;;
        s) sudo docker-compose stop ;;
        l) sudo docker ps -a \
                --filter "name=jes_nginx" \
                --filter "name=jes_php" \
                --filter "name=jes_mysql"
            ;;
        d)
            if [ $OPTARG == "c" ]; then
                sudo docker-compose stop \
                && sudo docker rm \
                    jes_nginx \
                    jes_php \
                    jes_mysql
            elif [ $OPTARG == "i" ]; then
                sudo docker-compose stop \
                && sudo docker rmi \
                    docker_php-app \
                    docker_http-nginx \
                    docker_mysql-db
            else
                echo "-$opt $OPTARG not found"
            fi
            ;;
        *) echo "Invalid Option: -$opt requires an argument" ;;
    esac
done