# Basing our container off of nvidia/cuda official Docker container images
FROM nvcr.io/nvidia/tensorflow:22.08-tf1-py3

# Setting /bin/bash as the default shell due to bugs with the default shell environment with python3.7 installed manually
RUN ln -sf /bin/bash /bin/sh

# Adding python3.7
RUN apt update && apt upgrade -y && apt install git file -y

# Cloning and setting up the the project
WORKDIR /srv
RUN git clone https://github.com/vernamlab/FastSpec .
RUN pip install matplotlib protobuf keras==2.6.0

# Building the default dataset (only for debugging, disable for deployment!)
# RUN cd dataset && sh ./build.sh
