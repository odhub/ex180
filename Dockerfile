FROM jboss/base-jdk:11
ENV JBOSS_HOME /opt/rh/jboss-eap-7.4
WORKDIR /opt/rh
USER root
RUN mkdir -p /opt/rh
COPY jboss-eap-7.4.0.zip /tmp/jboss-eap-7.4.0.zip
RUN unzip /tmp/jboss-eap-7.4.0.zip
RUN chown -R jboss:jboss /opt/rh
RUN rm -f /tmp/jboss-eap-7.4.0.zip
RUN $JBOSS_HOME/bin/add-user.sh admin Passw0rd123 --silent
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf
ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-full-ha.xml
EXPOSE 8080 9990 9999
ADD myapp.war "$JBOSS_HOME/standalone/deployments"
USER jboss
CMD /bin/bash

