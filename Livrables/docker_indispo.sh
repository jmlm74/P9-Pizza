#! /bin/bash
echo "docker-compose stop"
docker-compose stop
echo "lancement site d attente"
docker run -dit --name ocp -p 80:80 -v /home/ocpizza/siteattente/:/usr/local/apache2/htdocs/ httpd:2.4
