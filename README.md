# Overview 
This project will create a docker container on windows that is custom tailored to build a tianocore project. 
It contains a few bat scripts to automate the process and get you developing quicker.
The idea is to limit the dependencies needed to build a project and allow a portable install on any machine 


# Single Dependency: 
### Docker for windows 
To Install: 
    Download from https://hub.docker.com/editions/community/docker-ce-desktop-windows
OR  run winget install --id Docker.DockerDesktop


# setup.bat 
setup.bat does a few things:
- start a docker container that has all needed dependencies
- mount the current directory to /src/mnt in the container 
- git clone the tianocore library 
- update submodules in tianocore library 
- set up tianocore vars in docker
- build the tianocore tools

# TianoBuild.bat
TianoBuild.bat will:
- run "build" in the direcoty in the container 
