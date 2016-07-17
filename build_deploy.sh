for TAG_NAME in "${TAG_NAMES[@]}"
do
  docker rmi $IMAGE_NAME:$TAG_NAME
  docker build -t $IMAGE_NAME:$TAG_NAME .
  if [ "$1" == "--deploy" ]; then
    docker push $IMAGE_NAME:$TAG_NAME
  fi
done
