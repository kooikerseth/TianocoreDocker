FROM ubuntu:16.04
RUN /bin/bash
RUN apt-get update 
RUN apt-get install -y build-essential uuid-dev iasl git gcc-5 nasm python3 dos2unix
WORKDIR /src/mnt/edk2
CMD ["/bin/bash"]