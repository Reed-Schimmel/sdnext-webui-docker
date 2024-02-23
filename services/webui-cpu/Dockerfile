FROM python:3.10-bookworm

RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update \
  && apt-get upgrade -y \
  && apt-get install git python3-pip libgl1-mesa-glx -y

# Clone vladmandic's stable diffusion
RUN \
  git clone https://github.com/vladmandic/automatic stable-diffusion-webui
WORKDIR /stable-diffusion-webui

# Ugly hack to pre-install dependencies
RUN head -n 230 "launch.py" > install.py && python3 install.py

# Start Container
COPY start.sh /usr/local/bin
CMD ["start.sh"]