FROM lambci/lambda:build-python3.7

ENV PYTHON_VERSION=3.7.7
ENV SNDFILE_VERSION=1.0.28

RUN yum install -y tar xz yum-utils

WORKDIR /tmp

RUN curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz
RUN tar xf Python-${PYTHON_VERSION}.tar.xz

RUN mkdir -p "/tmp/sndfile"

RUN yum install -y autoconf autogen automake build-essential libasound2-dev \
  libflac-dev libogg-dev libtool libvorbis-dev libopus-dev pkg-config gcc-c++

WORKDIR "/tmp/sndfile"

RUN curl -L -o "libsndfile-${SNDFILE_VERSION}.tar.gz" "http://www.mega-nerd.com/libsndfile/files/libsndfile-${SNDFILE_VERSION}.tar.gz"

RUN tar xf "libsndfile-${SNDFILE_VERSION}.tar.gz"

WORKDIR "/tmp/sndfile/libsndfile-${SNDFILE_VERSION}"

RUN ./configure --prefix=/opt/
RUN make
RUN make install

# set workdir back
WORKDIR /var/task