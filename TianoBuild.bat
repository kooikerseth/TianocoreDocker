@echo off

docker start tianocore_container
docker exec -it tianocore_container bash -c "cd edk2/; . edksetup.sh; build"
docker stop tianocore_container
