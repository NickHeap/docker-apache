docker stop apache-oe117
docker rm apache-oe117

docker build -t apache-oe117:0.1 -t apache-oe117:latest .
pause
docker run -i --name apache-oe117 -p 80:80 -v D:\workspaces\webspeed:/usr/local/apache2/htdocs -v D:\workspaces\webspeed\logs:/usr/local/apache2/logs -v D:\workspaces\webspeed\webspeed.envvars:/usr/local/apache2/webspeed.envvars apache-oe117