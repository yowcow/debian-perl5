FROM debian:stretch

MAINTAINER Yoko OYAMA <yowcow@cpan.org>

RUN set -eux; \
    apt-get update && \
    apt-get -yqq install build-essential curl perl cpanminus && \
    cpanm Devel::PatchPerl && \
    rm -rf /var/lib/apt/lists/* /root/.cpanm

RUN set -eux; \
    cd /tmp && \
    curl -LO http://www.cpan.org/src/5.0/perl-5.10.1.tar.gz && \
    tar xzf perl-5.10.1.tar.gz && \
    perl -MDevel::PatchPerl -e 'Devel::PatchPerl->patch_source("5.10.1", "./perl-5.10.1");' && \
    cd perl-5.10.1 && \
    ./Configure -des && make && make install && \
    cd .. && rm -rf perl-5.10.1.tar.gz perl-5.10.1 && \
    curl -L https://cpanmin.us/ -o /usr/local/bin/cpanm && chmod +x /usr/local/bin/cpanm
