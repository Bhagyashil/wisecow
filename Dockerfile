# Use Ubuntu as base image
FROM ubuntu:22.04

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: fortune, cowsay, netcat, bash
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add cowsay to PATH
ENV PATH="/usr/games:${PATH}"

# Set working directory
WORKDIR /app

# Copy the wisecow shell script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose port 4499
EXPOSE 4499

# Run the app
CMD ["bash", "wisecow.sh"]
