FROM eclipse-temurin:17-jdk

ENV GEOSERVER_VERSION=2.23.2
ENV GEOSERVER_HOME=/opt/geoserver

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip/download -O geoserver.zip && \
    unzip geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} $GEOSERVER_HOME && \
    rm geoserver.zip

# Expose Render's dynamic port
EXPOSE 8080

# Start GeoServer on the correct port
CMD ["sh", "-c", "cd $GEOSERVER_HOME && java -DGEOSERVER_DATA_DIR=$GEOSERVER_HOME/data_dir -Djetty.port=$PORT -jar start.jar"]
