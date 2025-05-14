# https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html

FROM ubuntu:24.04

WORKDIR /ansible
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install -y ansible
RUN apt install -y vim
RUN apt install -y git
RUN apt install -y openssh-server
RUN git clone https://github.com/ansible-lockdown/UBUNTU24-CIS.git