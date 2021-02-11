FROM ubuntu:latest
# tzinfo tries to interact with us unless we set this
ENV DEBIAN_FRONTEND=noninteractive

RUN set -x && \
        apt-get update -y -qq && \
        apt-get upgrade -y -qq --no-install-recommends && \
        apt-get install -y -qq \
        git \
        nasm \
        build-essential \
        gdb \
        tmux \
        qemu \
        qemu-system

WORKDIR /home/root/xv6/

COPY ./ ./

RUN make

CMD ["/bin/bash"]