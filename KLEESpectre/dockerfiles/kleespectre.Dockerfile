FROM klee/klee:2.1
RUN sudo apt update && sudo apt upgrade -y && sudo apt install libssl-dev git -y
RUN sudo apt-get install build-essential curl libcap-dev git cmake libncurses5-dev python-minimal python-pip unzip libtcmalloc-minimal4 libgoogle-perftools-dev libsqlite3-dev doxygen -y
RUN pip3 install tabulate
RUN sudo apt-get install clang-6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-tools -y

# STP installation steps
RUN sudo apt-get install cmake bison flex libboost-all-dev python perl minisat -y
RUN git clone https://github.com/stp/stp.git \
    && cd stp/ \
    && git checkout 2.3.3 \
    && git submodule init && git submodule update \
    # && ls -lah \
    # && ./scripts/deps/setup-gtest.sh \
    # && ./scripts/deps/setup-outputcheck.sh \
    && mkdir build \
    && cd build \
    && cmake .. \
    && cmake --build . \
    && sudo cmake --install .

# uClibc installation steps
RUN git clone https://github.com/klee/klee-uclibc.git \
    && cd klee-uclibc \
    && ./configure --make-llvm-lib \
    && make -j12 \
    && sudo make install

RUN git clone https://github.com/winter2020/kleespectre.git \
    && cd kleespectre/klee/ \
    && mkdir build

ADD ./build.sh /home/klee/kleespectre/klee/build/build.sh

RUN cd kleespectre/klee/build/ \
    && ./build.sh \
    && make -j 12