# Mule EE Docker Image

The repository provide a Dockerfile to build Mule EE docker images.

The Dockerfile defines 2 build arguments to specify the JDK and the mule runtime version.

 | ARG             	| DEFAULT       	| DESCRIPTION                                 	|
 |-----------------	|---------------	|---------------------------------------------	|
 | RUNTIME_VERSION 	| 3.9.3         	| Mule Runtime Version                        	|
 | JAVA_BINARIES   	| AdoptOpenJDK8 	| URL to download the java binaries `.tar.gz` 	|

## Build the docker
### With default build args
To build the image navigate to the docker folder and run the docker build command.

```shell
docker build -it mariocairone/mule-ee:3.9.3 .
```

### With non default mule runtime version

Build the image for a different mule runtime version
```shell
docker build --build-arg RUNTIME_VERSION=4.2.1 -t mariocairone/mule-ee:4.2.1 .
```
