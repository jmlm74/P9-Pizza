#! /bin/bash
echo "docker-compose stop"
docker-compose stop
echo "lancement site d attente"
docker run -dit --name ocp -p 80:80 -v /home/ocpizza/siteattente/:/usr/local/apache2/htdocs/ httpd:2.4
echo "docker-compose rm -f"
docker-compose rm -f
echo "docker system prune -a -f"
docker system prune -a -f
echo "docker-compose pull"
docker-compose pull
echo "arret site d attente"
docker stop ocp
echo "docker-compose up -d"
docker-compose up -d
