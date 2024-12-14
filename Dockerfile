FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget curl python3 python3-pip libnss3-dev gconf-service unzip tar libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils libgbm-dev npm nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh 

RUN bash nodesource_setup.sh

RUN apt install nodejs -y

RUN pip3 install --no-cache --upgrade pip

RUN pip3 install --no-cache notebook jupyterlab
# Create user
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

#RUN wget https://github.com/Solo120140/Sologotemm-/releases/download/datagetforcpu/dataget.tar.gz && \
#tar -xvf dataget.tar.gz && \
#npm install
    
    
