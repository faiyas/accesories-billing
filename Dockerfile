# Use the official Nginx image as the base
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy static site files to nginx web root
COPY . /usr/share/nginx/html

# Expose port 8000 explicitly
EXPOSE 8000

# Completely override the default.conf with our own guaranteed 8000 setup
RUN echo "server { listen 0.0.0.0:8000; root /usr/share/nginx/html; index index.html; }" > /etc/nginx/conf.d/default.conf

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
