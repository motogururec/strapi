# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM node:20-alpine

# Create and change to the app directory.
WORKDIR /opt/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package.json yarn.lock ./

# Install dependencies.
RUN yarn install

# Copy local code to the container image.
COPY . .

# Build the app
RUN yarn build

# Run the web service on container startup.
CMD ["yarn", "start"]
