FROM centos/systemd

RUN yum -y install epel-release && \
    yum -y install ansible git python-gnupg && \
    yum -y install gcc gcc-c++ make openssl-devel python-devel && \
    curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" && \
    python /tmp/get-pip.py

WORKDIR /app

CMD ["init"]
