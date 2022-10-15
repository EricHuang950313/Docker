# [Docker](https://github.com/EricHuang950313/Docker)

### Architecture
> Dockerfile, a set of instructions to docker to create the image </br>
> Dockerfile creates layers on an image </br>

> images, blueprints for containers, read-only </br>
> images stores Runtime environment, Application code, Any dependencies, Extra configurations(e.g.env variables), Commands </br>
> images are made up from several layers </br>
> 1) parent image(including the OS and runtime environment)
> 2) source code  
> 3) dependencies
> 4) run commands

> container, running instance of an image </br>
> container is a box or a package that contains everything our application to run. It runs applications in isolated environments </br>
> container/VMs: https://geekflare.com/docker-vs-virtual-machine/ </br>

### Pre-work
1. npm init
2. in package.json
```
"dependencies": {
"cors": "^2.8.5",
"express": "^4.17.2"
}
```
```
"scripts": {
   "dev": "nodemon -L app.js"
}
```
3. npm install


### Commands: basic
```
Check images: docker images
Check processes: docker ps -a(all)
```
```
Create an image: docker build -t [image_name:certain_tag] [directory(relative path to Dockerfile)]
Create a container: docker run --name [container_name] -p [computer_port:container_port] -d(detached mode) [image_name:certain_tag]
Create a container with volumes: docker run --name [container_name] -p [computer_port:container_port] -rm(remove after stopped) -v [path_to_Dockerfile:path_to_conatiner] -v(anonymous volume: map to a folder managed by docker) [path_to_conatiner] [image_name:certain_tag]
```
```
Start a container: docker start [container_name]
Stop an container: docker stop [container_name]
```
```
Remove a container: docker container rm [container_name]
Remove an image: docker image rm [image_name] -f(need to force if it is in use)
Remove all: docker system prune -a
```

### Commands: using docker-compose
```
Start: docker-compose up
Stop: docker-compose down --rmi all -v
```
