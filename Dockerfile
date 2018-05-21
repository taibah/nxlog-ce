FROM ubuntu:16.04
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN apt update \
    && apt install -y curl \
    && curl -L https://nxlog.co/system/files/products/files/348/nxlog-ce_2.10.2102_ubuntu_xenial_amd64.deb -o /root/nxlog-ce_2.10.2102_ubuntu_xenial_amd64.deb \
    && dpkg -i /root/nxlog-ce_2.10.2102_ubuntu_xenial_amd64.deb || true \
    && apt install -f -y \
    && usermod -a -G adm nxlog \
    && systemctl disable nxlog
USER nxlog
STOPSIGNAL SIGTERM

CMD /usr/bin/nxlog -f -c /etc/nxlog/nxlog.conf
