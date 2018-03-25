docker stop apache-oe117
docker rm apache-oe117
docker run -i --name apache-oe117 -p 80:80 -v C:\workspaces\webspeed:/usr/local/apache2/htdocs apache-oe117
