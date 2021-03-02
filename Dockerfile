FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        ubuntu-desktop \
        unity-lens-applications \
        gnome-panel \
        metacity \
        nautilus \
        gedit \
        xterm \
        sudo \
	    firefox \
        bash \
        net-tools \
        novnc \
        socat \
        x11vnc \
        gnome-panel \
        gnome-terminal \
        xvfb \
	python3 \ 
	python3-pip \
        supervisor \
        net-tools \
        curl \
        git \
	curl \
	git \
	libffi-dev \
	libjpeg-dev \
	libjpeg-turbo8-dev \
	libwebp-dev \
	python3-lxml \
	postgresql \
	postgresql-client \
	python3-psycopg2 \
	libpq-dev \
	libcurl4-openssl-dev \
	libxml2-dev \
	libxslt1-dev \
	python3-pip \
	python3-sqlalchemy \
	openssl \
	wget \
	python3 \
	python3-dev \
	libreadline-dev \
	libyaml-dev \
	gcc \
	zlib1g \
	ffmpeg \
	libssl-dev \
	libgconf-2-4 \
	libxi6 \
	unzip \
	libopus0 \
	libopus-dev \
	    wget \
        libtasn1-3-bin \
        libglu1-mesa \
        libqt5webkit5 \
        libqt5x11extras5 \
        qml-module-qtquick-controls \
        qml-module-qtquick-dialogs \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN sudo apt update && sudo apt install neofetch

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_UNITY=yes

RUN adduser ubuntu

RUN echo "ubuntu:ubuntu" | chpasswd && \
    adduser ubuntu sudo && \
    sudo usermod -a -G sudo ubuntu


COPY . /app

RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh
USER ubuntu

CMD ["/app/run.sh"]
