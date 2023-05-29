# Base image with OpenResty and LuaJIT
FROM openresty/openresty:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y git unzip

# Clone your APISIX custom code repository
RUN git clone <your_repo_url> /opt/apisix

# Change working directory
WORKDIR /opt/apisix

# Install dependencies
RUN luarocks install --server=https://luarocks.org/dev apisix 0.3.1-0

# Expose the necessary ports
EXPOSE 9080 9443

# Set the entrypoint command
ENTRYPOINT ["sh", "/opt/apisix/docker-entrypoint.sh"]
