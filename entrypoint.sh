#!/bin/sh
cd /jmusic-bot
if ! test -f "./config.txt"; then
    envsubst < "/config.txt.sample" > "./config.txt"
fi
echo "Starting server"
java -Dnogui=true -jar $(ls JMusic*)