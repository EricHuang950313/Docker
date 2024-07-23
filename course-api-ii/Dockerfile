# pull the node image into our image as first or initial layer
FROM node:18-alpine

# specifying a working directory to install
# cached
WORKDIR /app

# cached
COPY package.json .

# RUN is an image build step, the state of the container after a RUN command will be committed to the container image
# a Dockerfile can have many RUN steps that layer on top of one another to build the image
# cached
RUN npm install

# COPY [source code from(relative path to Dockerfile)] [source code to in image(relative path to WORKDIR)]
COPY . .

# what port is going to expose by the container
EXPOSE 4000

# CMD is the command the container executes by default when you launch the built image
# a Dockerfile will only use the final CMD defined.
CMD [ "node", "app.js"]

# ENTRYPOINT is also closely related to CMD and can modify the way a container is started from an image.
