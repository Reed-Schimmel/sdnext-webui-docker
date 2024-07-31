FROM ubuntu:jammy

RUN \
  apt-get update \
  && apt-get install -y ca-certificates git wget gpg libgomp1 \
  && mkdir --parents --mode=0755 /etc/apt/keyrings \
  && wget https://repo.radeon.com/rocm/rocm.gpg.key \
  && sh -c "cat rocm.gpg.key | gpg --dearmor > /etc/apt/keyrings/rocm.gpg" \
  && sh -c "echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/6.1.2 jammy main' | tee /etc/apt/sources.list.d/rocm.list" \
  && sh -c "echo 'Package: *' > /etc/apt/preferences.d/rocm-pin-600" \
  && sh -c "echo 'Pin: release o=repo.radeon.com' >> /etc/apt/preferences.d/rocm-pin-600" \
  && sh -c "echo 'Pin-Priority: 600' >> /etc/apt/preferences.d/rocm-pin-600" \
  && apt-get upgrade -y \
  && apt-get update \
  && apt-get install -y rocm

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
