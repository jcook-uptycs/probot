FROM node:19.4.0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Ensure tools are installed
RUN git --version | tee -a /versions.txt \
  && bash --version | tee -a /versions.txt \
  && node --version | tee -a /versions.txt \
  && npm --version | tee -a /versions.txt

WORKDIR /action
ENV NODE_PATH=/usr/local/lib/node_modules
ENV PATH=/action/node_modules/.bin/:$PATH
COPY package*.json ./
RUN npm clean-install 

COPY * ./

