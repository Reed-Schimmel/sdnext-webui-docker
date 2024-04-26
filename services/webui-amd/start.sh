#!/bin/bash

# Execute
python3 launch.py --use-rocm --listen --port "${WEBUI_PORT:=7860}" "${CLI_ARGS}"