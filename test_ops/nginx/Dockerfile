#image
FROM ubuntu:16.04
MAINTAINER SUMIT ANAND

##update and install
RUN apt-get update
RUN apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf
###expose and start
EXPOSE 80
CMD ["nginx"]
