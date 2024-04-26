FROM python:3.10-bookworm

RUN \
  apt-get update \
  && apt-get upgrade -y \
  && apt-get install git python3-pip libgl1-mesa-glx rocminfo rocm-device-libs -y

# Create User Permissions
ARG DOCKER_USER=default_user
RUN useradd -m "$DOCKER_USER"

# Clone vladmandic's stable diffusion
RUN \
  git clone https://github.com/vladmandic/automatic /stable-diffusion-webui
WORKDIR /stable-diffusion-webui

# Ugly hack to pre-install dependencies
SHELL ["/bin/bash", "-c"]
RUN \
  _LINE1=$(grep -n "uv, instance = start_server(immediate=True, server=None)" "launch.py" | cut -d : -f 1) \
  && LINE1=$(($_LINE1-1)) \
  && head -n "$LINE1" "launch.py" > install.py \
  && tail -n 2 "launch.py" >> install.py \
  && python3 install.py --use-rocm

# Allow Config to Persist
RUN mkdir config \
  && touch config/config.json \
  && ln -s config/config.json config.json

# Start Container
RUN chown -R $DOCKER_USER:$DOCKER_USER /stable-diffusion-webui
USER $DOCKER_USER
COPY start.sh /usr/local/bin
CMD ["start.sh"]