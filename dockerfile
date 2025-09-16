FROM openjdk:17-jdk-slim

# Set environment variables
ENV GEOSERVER_VERSION=2.23.2
ENV GEOSERVER_HOME=/opt/geoserver

# Download and extract GeoServer
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip/download -O geoserver.zip && \
    unzip geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} $GEOSERVER_HOME && \
    rm geoserver.zip

# Expose default GeoServer port
EXPOSE 8080

# Start GeoServer
CMD ["sh", "-c", "$GEOSERVER_HOME/bin/startup.sh && tail -f /dev/null"]
