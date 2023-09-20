FROM opavlova/glassfish:4.1-jdk8

# Copy your .der certificate file into the container
COPY google.der /tmp/google.der

# For JNDI @ DB Conn Pool. Change in the domain.xml
COPY mysql-connector-java-commercial-5.1.14-bin.jar /usr/local/glassfish4/glassfish/lib/
# COPY domain.xml /usr/local/glassfish4/glassfish/domains/domain1/config/

# Import the .der certificate into the GlassFish truststore (cacerts.jks)
RUN keytool -import -trustcacerts -noprompt -alias cascrt -file /tmp/google.der -keystore /usr/local/glassfish4/glassfish/domains/domain1/config/cacerts.jks -storepass changeit

# Delete the old self-signed certificates
RUN cd /usr/local/glassfish4/glassfish/domains/domain1/config/ && \
    keytool -delete -alias s1as -keystore keystore.jks -storepass changeit && \
    keytool -delete -alias glassfish-instance -keystore keystore.jks -storepass changeit && \
    keytool -delete -alias glassfish-instance -keystore cacerts.jks -storepass changeit && \
    keytool -delete -alias s1as -keystore cacerts.jks -storepass changeit




