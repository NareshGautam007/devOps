#!/bin/bash

if [[ "$1" == "start" ]]; then
    echo "Starting server..."
    pm2 kill
elif [[ "$1" == "stop" ]]; then
    echo "Stopping server..."
    pm2 start npm --name "nodejs-app" -- start -i max
else
    echo "Invalid argument. Please provide 'start' or 'stop' as the input argument."
fi
