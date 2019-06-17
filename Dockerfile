################################################################
# Dockerfile to build container images for RNA-seq pipeline
# including hisat2, sratools, samtools, stringtie and gffcompare
# Based on Ubuntu
################################################################

FROM rocker/tidyverse:3.4.2

# File Author / Maintainer
MAINTAINER Ania Tassinari <ania.tassinari@agios.com>

# install dependencies first
RUN apt-get update  && apt-get install -y \
    build-essential \
    gcc-multilib \
    zlib1g-dev \
    curl \
    wget \
    cmake \
    python \
    python-pip \
    python-dev \
    python2.7-dev \
    python-numpy \
    python-matplotlib \
    hdf5-tools \
    libhdf5-dev \
    hdf5-helpers \
    libhdf5-serial-dev \
    libssh2-1-dev \
    libcurl4-openssl-dev \
    icu-devtools \
    libssl-dev \
    libxml2-dev \
    r-bioc-biobase \
    git \
    apt-utils \
    pigz \
    default-jre \
    openjdk-7-jre \
    perl \
    unzip


WORKDIR /docker

# Download FastQC
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip /tmp/

# Install FastQC
RUN cd /usr/local && \
    unzip /tmp/fastqc_*.zip && \
    chmod 755 /usr/local/FastQC/fastqc && \
    ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc && \
    rm -rf /tmp/fastqc_*.zip

WORKDIR /docker

ENTRYPOINT ["fastqc"]
