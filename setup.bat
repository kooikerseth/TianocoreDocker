
@echo off
docker build -t tiano_image_build .
docker run -dt^
    --name tianocore_container^
    --mount type=bind,source=%CD%,target=/src/mnt^
    tiano_image_build
docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container git clone https://github.com/tianocore/edk2
docker exec -it tianocore_container bash -c "cd edk2; git submodule update --init"

docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container bash -c "cd edk2; make -C BaseTools; . edksetup.sh"

docker stop tianocore_container
docker start tianocore_container

docker exec -it tianocore_container bash -c "cd edk2;export EDK_TOOLS_PATH=/src/mnt/edk2/BaseTools; . edksetup.sh BaseTools"
docker stop tianocore_container
