FROM ubuntu:20.04

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=ja_JP.UTF-8 \
    LC_ALL=${LANG} \
    LANGUAGE=${LANG} \
    TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN adduser ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd && \
    gpasswd -a ubuntu sudo && \
    mkdir -p /home/ubuntu

# Install packages
RUN apt update -y && apt upgrade -y && \
    apt install -y debian-keyring debian-archive-keyring \
      software-properties-common \
      apt-utils

# Install utilities
RUN apt install -y \
      jq \
      git \
      sudo \
      gnupg \
      expect \
      git \
      vim \
      curl \
      wget \
      jq \
      netcat \
      iproute2 \
      apt-utils \
      iputils-ping \
      net-tools \
      dnsutils \
      netplan.io \
      supervisor \
      apt-utils \
    # Clean up
    && \
    apt clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Setting ubuntu & Install openssh-server
RUN apt update -y && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd && \
    ln -s /usr/bin/python3.8 /usr/bin/python && \
    apt install -y python3-pip
#    ln -s /usr/bin/pip3 /usr/bin/pip

# Clean up
RUN apt clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Copy custom files
COPY home/* /home/ubuntu/
RUN chown ubuntu /home/ubuntu/* && \
    chgrp ubuntu /home/ubuntu/*

# Rename user directories Japanese to English.
RUN LANG=C xdg-user-dirs-update --force

# アクションのリポジトリからコードファイルをコンテナのファイルシステムパス `/`にコピー
COPY entrypoint.sh /entrypoint.sh
COPY supervisord/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisord/startup.conf /etc/supervisor/conf.d/startup.conf

# 開発環境として使用する際はCMDを有効化する
CMD nohup /usr/bin/supervisord &

# テスト自動化として利用する際はENTRYPOINTを有効化する
#ENTRYPOINT ["/entrypoint.sh"]
