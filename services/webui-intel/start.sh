#!/bin/bash

# Execute
ipexrun --multi-task-manager 'taskset' --memory-allocator 'jemalloc' launch.py --use-ipex --listen --port "${WEBUI_PORT:=7860}" "${CLI_ARGS}"