# sdnext-webui-docker

Docker containers for vladmantic's SD.Next project!

So far I only have containers supporting CPU, Intel Arc (IPEX) and AMD (ROCm) on Linux. No Nvidia/CUDA container yet but users with Nvidia cards are more than welcome to contribute!

`webui-intel` tested with Intel Arc A770

`webui-amd` tested with Radeon RX 6650 XT

`webui-cpu` tested with AMD Ryzen 9 3900X (CPU only so everything should work OOTB)

## Setup
- Clone this repository, cd into the new folder and use `docker compose` to build one of the webui containers:

```
 git clone https://github.com/vaqueiro24/sdnext-webui-docker.git
 cd sdnext-webui-docker
 docker compose up webui-[cpu,intel,amd]            # Build the container and run the WebUI
```
- Reach the webUI by navigating your browser to `localhost:7860` or on your local network with `<ip>:7860`

## Special Thanks

- vladmantic on Github for his SD.Next project
  - https://github.com/vladmandic/automatic
- AbdBarho for stable-diffusion-webui-docker that this work is based on
  - https://github.com/AbdBarho/stable-diffusion-webui-docker
- alann-sapone for his rocm container (used as inspiration, I took a differnet approach with mine)
  - https://github.com/alann-sapone/sd-next-amd-rocm-5700xt-docker