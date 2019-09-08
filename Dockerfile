FROM         centos:latest
MAINTAINER   Mario Cairone <mario.cairone@gmail.com>

# Define docker build ARGS
ARG JAVA_BINARIES=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u222b10.tar.gz
ARG RUNTIME_VERSION=4.2.1

# Define environment variables
ENV 	JAVA_BINARIES $JAVA_BINARIES
ENV 	TMP_DIR /tmp/
ENV 	JAVA_HOME /opt/jdk
ENV 	PATH $JAVA_HOME/bin:${PATH}
ENV 	MULE_ARGS "${MULE_ARGS:-start}"
ENV     RUNTIME_VERSION $RUNTIME_VERSION
ENV     MULE_HOME /opt/mule

WORKDIR     /opt

# Install necessary tools
RUN	curl -L ${JAVA_BINARIES} -o jdk.tar.gz && \
	mkdir jdk && \
	tar xf jdk.tar.gz -C jdk --strip-components 1 && \
	rm -rf jdk.tar.gz && \
	curl -L http://s3.amazonaws.com/new-mule-artifacts/mule-ee-distribution-standalone-${RUNTIME_VERSION}.tar.gz -O && \
	tar xvf mule-ee-distribution-standalone-${RUNTIME_VERSION}.tar.gz && \
	rm -rf mule-ee-distribution-standalone-${RUNTIME_VERSION}.tar.gz && \
	ln -s /opt/mule-enterprise-standalone-${RUNTIME_VERSION} mule  && \
	adduser mule && \
	chown -R mule:mule /opt/mule-enterprise-standalone-${RUNTIME_VERSION} 
	
# Define mount points
	
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains","/opt/mule/libs"]

# HTTP Service Port
# Expose the necessary port ranges as required by the Mule Apps
EXPOSE      8081-8082

EXPOSE      8091-8092

# Mule remote debugger
EXPOSE      5000

# Mule agent 
EXPOSE      7777

# Mule JMX port (must match Mule config file)
EXPOSE      1098

# Start Mule runtime
USER mule

CMD [ "/opt/mule/bin/mule", "$MULE_ARGS" ]
	