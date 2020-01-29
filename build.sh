#!/bin/bash

set -e

echo "*************************************************************************************************"
echo "Docker hub login"

docker login --username mariocairone --password $DOCKER_PASSWORD

echo "*************************************************************************************************"

for VERSION in 3.8.0 3.8.1 3.8.2 3.8.3 3.8.4 3.8.5 3.8.6 3.8.7 3.9.0 3.9.1 3.9.2 3.9.3 4.2.0 4.2.1
do
	echo "*************************************************************************************************"
    echo "Building image for runtime version ${VERSION}"
	docker build --build-arg RUNTIME_VERSION=${VERSION} -t mariocairone/mule-ee:${VERSION} . 
	echo "Image for version ${VERSION} build success"
	echo "Pushing image mariocairone/mule-ee:${VERSION}"
	docker push mariocairone/mule-ee:${VERSION} 
	echo "Image mariocairone/mule-ee:${VERSION} pushed to Docker Hub"
	echo "*************************************************************************************************"	
done

       
    