# Mule EE Docker Image
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/mariocairone/mule-ee) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mariocairone/mule-ee) ![Docker Pulls](https://img.shields.io/docker/pulls/mariocairone/mule-ee) ![Docker Stars](https://img.shields.io/docker/stars/mariocairone/mule-ee)

This repository contains base docker image to run Mule EE containers.
The image doesn't contain a valid license so by default it will run using the evaluation license expiring in 30 days.
## How to use
```
docker pull mariocairone/mule-ee:4.3.0
```

### Usage

For a simple application using Default HTTP/HTTPS port

```
docker run -d --name myMuleContainer -P -v ~/myAppsDir:/opt/mule/apps  -v ~/myLogsDir:/opt/mule/logs mariocairone/mule-ee:4.2.1
```

#### Noteworthy mount points

| Mount point       | Description                           |
|:------------------|:--------------------------------------|
| /opt/mule/apps    | Mule Application deployment directory |
| /opt/mule/domains | Mule Domains deployment directory     |
| /opt/mule/conf    | Configuration directory               |
| /opt/mule/logs    | Logs directory                        |
| /opt/mule/libs    | Libs directory                        |

#### Exposed ports

| Port      | Description                              |
|:----------|:-----------------------------------------|
| 8081-8082 | Default CloudHub public HTTP/HTTPS port  |
| 8091-8092 | Default CloudHub private HTTP/HTTPS port |
| 5000      | Mule remote debugger port                |
| 7777      | Mule Agent port                          |
| 1098      | Mule JMX port                            |
