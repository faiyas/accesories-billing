# Use the official Nginx image as the base
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy static site files to nginx web root
COPY . /usr/share/nginx/html

# Expose port 8000
EXPOSE 8000

# Run nginx on port 8000 instead of default 80
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]

# Update nginx config to listen on 0.0.0.0:8000
RUN sed -i 's/listen       80;/listen 0.0.0.0:8000;/g' /etc/nginx/conf.d/default.conf
