FROM alpine:3.6
MAINTAINER Simon Martin <havvoric@gmail.com>

VOLUME /news

RUN apk --no-cache add gcc g++ make perl perl-dev perl-utils && \
    cpan Set::IntSpan News::Newsrc MIME::Tools String::CRC32 && \
    apk --purge del gcc g++ make perl-dev perl-utils

ADD http://ubh.sourceforge.net/download/ubh-2.5.tar.gz /tmp

RUN cd /tmp && tar -xvf ubh-2.5.tar.gz && \
    cd ubh-2.5

RUN mkdir -p /data/output /data/config

