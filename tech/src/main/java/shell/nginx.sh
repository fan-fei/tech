#!/bin/bash

apt update
echo y| apt install nginx

cd /etc/nginx/
cp nginx.conf nginx.conf.default


#FTP SERVER CONFIGURATION
#server {
#        listen             80;
#        server_name        www.fanfei.tech;
#        charset            utf-8;
#
#        location / {
#            root         /srv/ftp;
#            autoindex    on;
#
#        }
#}

#HTTPS CONFIGURATION
#server{
#        listen                    443 default ssl;
#        ssl                       on;
#        ssl_certificate           /etc/nginx/conf.d/www.fanfei.tech.pem;
#        ssl_certificate_key       /etc/nginx/conf.d/www.fanfei.tech.key;
#        server_name               www.fanfei.tech;

#        location ~* \.html$ {
#            root                  /var/www/html/;
#        }

#        location / {
#            proxy_redirect        off;
#            proxy_read_timeout    600;
#            proxy_pass            http://localhost:8080/;
#            proxy_set_header      Upgrade $http_upgrade;
#            proxy_set_header      Connection "upgrade";
#        }
#}

/etc/init.d/nginx restart

# /var/www/html