FROM httpd:2.4

# add our cgi-bin files
COPY cgi-bin/ /usr/local/apache2/cgi-bin/
RUN chmod a+x /usr/local/apache2/cgi-bin/cgi

# make printenv runnable for testing
RUN sed -i '1s/^/\#\!\/usr\/bin\/perl\n/' /usr/local/apache2/cgi-bin/printenv
RUN chmod a+x /usr/local/apache2/cgi-bin/printenv

# copy in our apache config
COPY conf/ /usr/local/apache2/conf/
#COPY bin/ /usr/local/apache2/bin/

# copy our required dlc files
COPY dlc/ /usr/dlc/

# ENV WRKDIR=/usr/local/apache2/logs/ \
#     DLC=/usr/dlc \
#     PROMSGS=/usr/dlc/promsgs \
#     WEBSPEED_DOMAIN=webspeed \
#     WEBSPEED_HOST=docker.for.win.localhost \
#     WEBSPEED_SERVICE=wsbroker1 \
#     WEBSPEED_PORT=3055

# allow logs and htdocs to be 
VOLUME /usr/local/apache2/logs/
VOLUME /usr/local/apache2/htdocs/

EXPOSE 80 3301-3325/udp
