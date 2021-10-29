
@echo off
docker build -t tiano_image_build .
docker run -dt^
    --name tianocore_container^
    --mount type=bind,source=%CD%,target=/src/mnt^
    tiano_image_build
docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container git clone https://github.com/tianocore/edk2 .
docker exec -it tianocore_container git submodule update --init

docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container make -C BaseTools
docker exec -it tianocore_container bash edksetup.sh

docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container source edksetup.sh

docker stop tianocore_container
