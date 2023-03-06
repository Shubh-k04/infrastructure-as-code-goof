FROM php:8.0-cli

# Create a non-root user and set the working directory
RUN adduser -D myuser
WORKDIR /usr/src/myapp

# Install necessary packages
RUN apk add --no-cache git

# Copy application files
COPY src/ /usr/src/myapp

# Switch to non-root user
USER myuser

# Start the PHP built-in web server on port 8000
CMD ["php", "-S", "0.0.0.0:8000"] 
