# pull the node image into our image as first or initial layer (1)
FROM node:18-alpine

# automatically restarting the node application when file changes in the directory are detected
RUN npm install -g nodemon

# specifying a working directory to install
WORKDIR /app

# cache: COPY package.json .
# cache: RUN npm install

COPY package*.json .

# RUN is an image build step, the state of the container after a RUN command will be committed to the container image
# a Dockerfile can have many RUN steps that layer on top of one another to build the image
RUN npm install

# COPY [source code from(relative path to Dockerfile)] [source code to in image(WORKDIR)]
COPY . .

# what port is going to expose by the container
EXPOSE 4000

# CMD is the command the container executes by default when you launch the built image
# a Dockerfile will only use the final CMD defined.
# without nodemon: CMD [ "node", "app.js" ]
# with nodemon: CMD [ "npm", "run", "dev" ]
CMD [ "npm", "run", "dev" ]

# ENTRYPOINT is also closely related to CMD and can modify the way a container is started from an image.
