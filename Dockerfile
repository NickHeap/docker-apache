# use ws install to get the files we need
FROM oe117-ws:latest AS ws_install

# our main stage
FROM httpd:2.4

# copy the messenger files
COPY --from=ws_install /usr/dlc/promsgs /usr/dlc/
COPY --from=ws_install /usr/dlc/bin/cgiip /usr/dlc/bin/
COPY --from=ws_install /usr/dlc/lib/libenhlog.so /usr/dlc/lib/
COPY --from=ws_install /usr/dlc/properties/ubroker.properties /usr/dlc/properties/

# add our cgi-bin files
COPY cgi-bin/ /usr/local/apache2/cgi-bin/
RUN chmod a+x /usr/local/apache2/cgi-bin/cgi
RUN chmod a+x /usr/local/apache2/cgi-bin/cgiip.exe

# make printenv runnable for testing
RUN sed -i '1s/^/\#\!\/usr\/bin\/perl\n/' /usr/local/apache2/cgi-bin/printenv
RUN chmod a+x /usr/local/apache2/cgi-bin/printenv

# copy in our apache config
COPY conf/ /usr/local/apache2/conf/

# use our own version of the startup script
COPY httpd-foreground /usr/local/bin/
RUN chmod a+x /usr/local/bin/httpd-foreground

# allow logs and htdocs to be 
VOLUME /usr/local/apache2/logs/
VOLUME /usr/local/apache2/htdocs/

ENV \
 NAMESERVER_HOST="host.docker.internal" \
 NAMESERVER_PORT="5162" \
 WEBSPEED_SERVICE="wsbroker1" \
 LOGGING_LEVEL="5" \
 VHOST_SERVERNAME="docker" \
 VHOST_SERVERALIAS="www.docker" \
 VHOST_DIRECTORY_INDEX="" \
 VHOST_STATIC_ALIAS="" \
 VHOST_STATIC_PATH=""

EXPOSE 80 3301-3325/udp
