FROM rockylinux:9.3

RUN yum install -y git make wget tar gcc &&\
    yum clean all &&\
    rm -rf /var/cache/yum

# intall musl-gcc
ENV MUSL_VERSION=1.2.5
WORKDIR /opt/app/musl
RUN wget https://www.musl-libc.org/releases/musl-$MUSL_VERSION.tar.gz &&\
    tar -xzf musl-$MUSL_VERSION.tar.gz &&\
    cd musl-$MUSL_VERSION &&\
    ./configure &&\
    make &&\
    make install
ENV PATH="/usr/local/musl/bin:${PATH}"

WORKDIR /opt/app/
RUN rm -rf /opt/app/musl

RUN git clone https://github.com/Notselwyn/CVE-2024-1086.git
# create user
RUN groupadd --gid 99999 tester
RUN useradd --uid 99999 --gid 99999 -ms /bin/bash tester
RUN chown -R tester /opt/app/CVE-2024-1086
USER tester

WORKDIR /opt/app/CVE-2024-1086
RUN make


ENTRYPOINT ["bash"]

