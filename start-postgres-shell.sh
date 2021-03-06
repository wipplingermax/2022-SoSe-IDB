SERVICE='db_postgres'

# Check if root privileges are granted, if not: try to re-run with root privileges
if [ $(id -u) -ne 0 ]
then
  exec sudo bash "$0"
fi

# test if container is already running
CONTAINER_ID=$(sudo docker ps | grep "$SERVICE" | sed -r 's/\ .*//') 

if [ "$CONTAINER_ID" != "" ]
then
  echo 'Container ' $SERVICE ' found' 
  echo 'id: ' $CONTAINER_ID
  echo 'try to attach to container...'
  
  docker exec -it $CONTAINER_ID psql -U postgres

# container not already running, search for images
else
    echo 'Container ' $BACKEND ' not found'
    echo 'Try to run image...'

    # schauen, ob Image vorhanden    
    IMAGE_ID=$(sudo docker image ls | grep _backend | sed -r 's/\ .*//') 
    
    if [ "$IMAGE_ID" != "" ]
    then
        echo 'Image ' $SERVICE ' found' 
        echo 'id: ' $IMAGE_ID
        echo 'Try to start image...'
      
        docker-compose run $SERVICE psql -U postgres
    else
      echo 'Image not found'
      echo 'Try to build and run image...'
      docker-compose run $SERVICE psql -U postgres
    fi    
fi