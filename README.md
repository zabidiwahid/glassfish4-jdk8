# GlassFish 4 Docker Image with JDK 8 and SSL Handshake Prevention

This repository contains a Dockerfile and associated files to build a Docker image for GlassFish 4 with JDK 8. 
The primary focus of this image is to address and prevent SSL handshake issues in GlassFish.

## SSL Handshake Prevention

### Docker Approach

GlassFish can sometimes encounter SSL handshake problems due to trust issues with certificates. To prevent these issues and ensure secure SSL/TLS connections, you can follow these essential steps:

1. cd repo

2. docker build -t glassfish-jdk8-ssl .

3. docker run -d -p 8080:8080 -p 4848:4848 glassfish-jdk8-ssl

 ### Without Docker Approach  

 For a traditional approach without docker, you can follow the step in the Dockerfile on importing .der certificate into the GlassFish truststore (cacerts.jks)

**Note:** You can get the .der certificate by go to that particular URL using any browser and click the :lock: icon to download. Save it as .der



