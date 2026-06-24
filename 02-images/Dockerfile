# Base image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx page
RUN rm -f index.html

# Copy our custom page
COPY app/index.html .

# Document the port
EXPOSE 80

# Start nginx (inherited from base image)
CMD ["nginx", "-g", "daemon off;"]
