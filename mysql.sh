podman run --name=wpdb --pod=wordpress -d -v /var/local/mysql/:/var/lib/mysql/data/ -e MYSQL_USER=user1 -e MYSQL_PASSWORD=Passw0rd -e MYSQL_DATABASE=db01 -e MYSQL_ROOT_PASSWORD=Passw0rd rhscl/mariadb-103-rhel7 
