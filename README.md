# docker-apache

docker build -t oe117-apache:0.1 -t oe117-apache:latest .

<https://httpd.apache.org/docs/2.4/env.html>

docker run -i --name oe117-apache -p 80:80 -v D:\workspaces\webspeed/usr/local/apache2/htdocs -v D:\workspaces\webspeed\logs:/usr/local/apache2/logs -v D:\workspaces\webspeed\webspeed.envvars:/usr/local/apache2/webspeed.envvars oe117-apache

docker run -it --rm --name oe117-apache -p 80:80 -v D:\workspaces\docker-volumes\webspeed:/usr/local/apache2/htdocs -v D:\workspaces\docker-volumes\webspeed\logs:/usr/local/apache2/logs -v D:\workspaces\docker-volumes\webspeed\webspeed.envvars:/usr/local/apache2/webspeed.envvars -v D:\workspaces\docker-volumes\webspeed\httpd-vhosts.conf:/usr/local/apache2/extra/httpd-vhosts.conf oe117-apache

docker run -it --rm --name oe117-apache -p 80:80 -v D:\workspaces\docker-volumes\webspeed:/usr/local/apache2/htdocs -v D:\workspaces\docker-volumes\webspeed\logs:/usr/local/apache2/logs -v D:\workspaces\docker-volumes\webspeed\httpd-vhosts.conf:/usr/local/apache2/extra/httpd-vhosts.conf oe117-apache

docker exec -it oe117-apache bash
