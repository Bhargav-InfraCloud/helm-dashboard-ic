# Stage 1: Build
FROM ubuntu:20.04 AS builder

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    curl \
    ca-certificates

# Install Go
ENV GO_VERSION=1.22.3
RUN wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Set Go environment variables
ENV PATH="/usr/local/go/bin:${PATH}"

# Install Node.js and npm
ENV NODE_VERSION=20.x
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Copy the rest of the application source code
COPY . .

# Build helm-dashboard
RUN make build
