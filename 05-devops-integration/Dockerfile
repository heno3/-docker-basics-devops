# Base image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx page
RUN rm -f index.html

# Copy our custom page
COPY app/index.html .

# Health check
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost || exit 1

# Document the port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
