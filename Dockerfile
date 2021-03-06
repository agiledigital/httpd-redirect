FROM centos/httpd-24-centos7

USER root

COPY httpd-cfg/httpd.conf /tmp/httpd.conf
COPY scripts/template-config.sh /tmp/template-config.sh
COPY scripts/start.sh /tmp/start.sh

# TODO: Work out how to handle OpenShift permissions properly
# Instead of just setting these files open to everyone

RUN chown 1001:0 /tmp/httpd.conf
RUN chown 1001:0 /tmp/template-config.sh
RUN chown 1001:0 /tmp/start.sh

RUN chmod 777 /tmp/httpd.conf
RUN chown 777 /tmp/template-config.sh
RUN chown 777 /tmp/start.sh

USER 1001

CMD ["/tmp/start.sh"]