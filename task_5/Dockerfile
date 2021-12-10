FROM alpine:3.14
RUN apk update
RUN apk add --no-cache apache2

COPY  index.html  /var/www/localhost/htdocs
EXPOSE 80

CMD ["/usr/sbin/httpd", "-f", "/etc/apache2/httpd.conf", "-D FOREGROUND"]
