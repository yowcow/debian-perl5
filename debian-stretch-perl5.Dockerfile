FROM debian:stretch

MAINTAINER Yoko OYAMA <yowcow@cpan.org>

RUN set -eux; \
    apt-get update && \
    apt-get -yqq install build-essential curl perl cpanminus && \
    cpanm Devel::PatchPerl && \
    rm -rf /var/lib/apt/lists/* /root/.cpanm

RUN set -eux; \
    cd /tmp && \
    curl -LO http://www.cpan.org/src/5.0/perl-##PERL_VERSION##.tar.gz && \
    tar xzf perl-##PERL_VERSION##.tar.gz && \
    perl -MDevel::PatchPerl -e 'Devel::PatchPerl->patch_source("##PERL_VERSION##", "./perl-##PERL_VERSION##");' && \
    cd perl-##PERL_VERSION## && \
    ./Configure -des && make && make install && \
    cd .. && rm -rf perl-##PERL_VERSION##.tar.gz perl-##PERL_VERSION## && \
    curl -L https://cpanmin.us/ -o /usr/local/bin/cpanm && chmod +x /usr/local/bin/cpanm
