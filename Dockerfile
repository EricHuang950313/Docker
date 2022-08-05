# container(a box or a package that contains everything our application to run), running instance of an image
# container runs applications in isolated environments
# container/VMs: https://geekflare.com/docker-vs-virtual-machine/
# images(blueprints for containers), read-only
# images stores Runtime environment, Application code, Any dependencies, Extra configurations(e.g.env variables), Commands
# images are made up from several layers
# 1) parent image(includes the OS and runtime environment)
# 2) source code  
# 3) dependencies
# 4) run commands
# Dockerfile(set of instructions to docker to create the image)
# Dockerfile creates layers on an image


# npm init
# === package.json ===
# "dependencies": {
#   "cors": "^2.8.5",
#   "express": "^4.17.2"
# }
# ====================
# npm install

# pull the node image into our image as first or initial layer (1)
FROM node:18-alpine

# automatically restarting the node application when file changes in the directory are detected
RUN npm install -g nodemon
# ======== package.json ======
# "scripts": {
#   "dev": "nodemon -L app.js"
# },
# ============================

# specifying a working directory to install
WORKDIR /app

# cache: COPY package.json .
# cache: RUN npm install

# COPY [source code from(relative path to Dockerfile)] [source code to in image(WORKDIR)]
COPY . .

# RUN is an image build step, the state of the container after a RUN command will be committed to the container image
# a Dockerfile can have many RUN steps that layer on top of one another to build the image
RUN npm install

# what port is going to expose by the container
EXPOSE 4000

# CMD is the command the container executes by default when you launch the built image
# a Dockerfile will only use the final CMD defined.
# without nodemon: CMD [ "node", "app.js" ]
# with nodemon: CMD [ "npm", "run", "dev" ]
CMD [ "npm", "run", "dev" ]

# ENTRYPOINT is also closely related to CMD and can modify the way a container is started from an image.

# images: docker images
# processes: docker ps -a(all)
# create an image: docker build -t [image_name:certain_tag] [directory(relative path to Dockerfile)]
# create a container: docker run --name [container_name] -p [computer_port:container_port] -d(detached mode) [image_name:certain_tag]
# create a container with volumes: docker run --name [container_name] -p [computer_port:container_port] -rm(remove after stopped) -v [path_to_Dockerfile:path_to_conatiner] -v(anonymous volume: map to a folder managed by docker) [path_to_conatiner] [image_name:certain_tag]
# start a container: docker start [container_name]
# stop an container: docker stop [container_name]
# remove a container: docker container rm [container_name]
# remove an image: docker image rm [image_name] -f(need to force if it is in use)
# remove all: docker system prune -a