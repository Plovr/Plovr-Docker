# Builds the image xvilo/plovr-base
FROM openjdk:8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Install deps
RUN apt update && apt install -y \
  git \
  ant \
  gcc \
  python \
  python-dev \
  build-essential \
  libssl-dev \
  nodejs

# Build BUCK
RUN git clone --depth 1 https://github.com/facebook/buck.git /buck/
WORKDIR /buck
RUN ant
RUN ln -sf /buck/bin/buck /usr/bin/
