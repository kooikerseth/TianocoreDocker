
@echo off
docker build -t tiano_image_build .
docker run -dt^
    --name tianocore_container^
    --mount type=bind,source=%CD%,target=/src/mnt^
    tiano_image_build
docker exec -it tianocore_container git clone https://github.com/tianocore/edk2 ../
docker exec -it tianocore_container git submodule update --init
docker exec -it tianocore_container make -C BaseTools
docker exec -it tianocore_container bash edksetup.sh
docker exec -it tianocore_container export EDK_TOOLS_PATH=/src/mnt/edk2/BaseTools
docker exec -it tianocore_container bash edksetup.sh BaseTools

docker stop tianocore_container