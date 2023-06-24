FROM debian:oldstable

# Install NGINX and other necessary dependencies
RUN apt-get update -y && apt-get install nginx openssl -y

# Remove default NGINX configuration files
RUN rm -rf /etc/nginx/conf.d/* && \
    mkdir -p /var/www && \
    mkdir -p /var/www/html &&\
    mkdir /etc/nginx/ssl
 
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/midfath.crt \
       -keyout /etc/nginx/ssl/midfath.key \
       -subj "/C=FR/ST=MAR/L=./O=1337 /OU=midfath/CN=midfath/"

# Copy your  file
COPY nginx.conf /etc/nginx/conf.d/
# COPY server.crt /tmp/
# COPY server.key /tmp/
COPY index.html /var/www/html

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
