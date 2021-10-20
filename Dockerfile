#Getting base image from CentOS 7
FROM centos

MAINTAINER myself <mymail@mail.com>

LABEL Remarks="This is a Dockerfile for CentOS System"

#Update Software Repository
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

#COPY /root/docker_images/WebSite/index.html /usr/share/nginx/html
COPY --from=node  . /usr/share/nginx/html/
#COPY nginx/staging-default.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

