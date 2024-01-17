docker ps -aq | xargs docker stop | xargs docker rm;

cd server/dbsync;

if docker volume ls | grep -q 'huge_tech_development_principal'
then
  #docker-volume-snapshot create huge_tech_development_principal huge_tech_development_principal.tar.gz
  echo "Database is ready!"
else
  docker-volume-snapshot restore huge_tech_development_principal.tar.gz huge_tech_development_principal

  sleep 20

  echo "Done restore snapshot!"
fi

cd ../../;

docker-compose -f docker-compose.development.yml build
docker-compose -f docker-compose.development.yml up
