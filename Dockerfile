FROM nginx:1.25.0
COPY nginx.conf /etc/nginx/nginx.conf
COPY message.conf /etc/nginx/templates/message.conf.template