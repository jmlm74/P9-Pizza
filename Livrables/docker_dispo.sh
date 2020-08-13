#! /bin/bash
echo "arret site d attente"
docker stop ocp
echo "docker-compose up -d"
docker-compose up -d
