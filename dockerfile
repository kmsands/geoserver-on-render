FROM docker.osgeo.org/geoserver:2.23.2

# Optional: expose port
EXPOSE 8080

# Optional: add PostGIS JDBC driver or config files here
# COPY postgis-jdbc.jar /opt/geoserver/webapps/geoserver/WEB-INF/lib/
