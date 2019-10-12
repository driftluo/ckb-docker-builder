FROM nervos/ckb-riscv-gnu-toolchain:bionic-20190702 AS builder
FROM nervos/ckb-docker-builder:bionic-rust-1.38.0

COPY --from=builder /riscv /riscv

RUN set -eux; \
    apt-get update; \
    apt-get install -y \
        autoconf \
        automake \
        autotools-dev \
        curl \
        libmpc-dev \
        libmpfr-dev \
        libgmp-dev \
        gawk \
        build-essential \
        bison \
        flex \
        texinfo \
        gperf \
        libtool \
        patchutils \
        bc \
        zlib1g-dev \
        libexpat-dev \
        cmake; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

ENV RISCV /riscv
ENV PATH "${PATH}:${RISCV}/bin"
