@REM @echo off

docker start tianocore_container
docker exec -it tianocore_container build
docker stop tianocore_container
