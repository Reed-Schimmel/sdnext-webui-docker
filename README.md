# sdnext-webui-docker

Docker containers for vladmantic's SD.Next project!

So far I only have containers supporting CPU and Intel Arc. I would love to make containers with Nvidia and AMD support but sadly I don't own either of their cards. Users with Nvidia/AMD cards are more than welcome to contribute to this project!

`webui-intel` tested with Intel Arc A770 GPU (most things work, need to test more)

`webui-cpu` tested with AMD Ryzen 9 3900X (CPU only so everything should work OOTB)

## Setup
- Clone this repository and cd:

```
 git clone https://github.com/vaqueiro24/sdnext-webui-docker.git
 cd sdnext-webui-docker
 docker-compose up webui-[cpu,intel]            # Build the container and run the WebUI
```
- Reach the webUI by navigating your browser to `localhost:7860`

## Special Thanks

- vladmantic on Github for his SD.Next project
  - https://github.com/vladmandic/automatic
- AbdBarho for stable-diffusion-webui-docker that this work is based on
  - https://github.com/AbdBarho/stable-diffusion-webui-docker
- alann-sapone for his rocm container
  - https://github.com/alann-sapone/sd-next-amd-rocm-5700xt-docker