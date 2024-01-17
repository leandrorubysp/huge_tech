docker ps -aq | xargs docker stop | xargs docker rm;

docker volume rm $(docker volume ls -q)
