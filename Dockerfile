# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    cowsay \
    fortune \
    netcat-traditional && \
    apt-get clean

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Set the working directory
WORKDIR /app

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the server port
EXPOSE 4499

# Set the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Set the startup command
CMD ["/bin/bash", "./wisecow.sh"]

