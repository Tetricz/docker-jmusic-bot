#!/bin/sh
cd /jmusic-bot
if ! test -f "./config.txt"; then
    envsubst < "/config.txt.sample" > "./config.txt"
fi
if ! test -f "./JMusic*"; then
    echo "Jarfile not found"
    echo "Downloading JMusic jarfile"
    curl -L $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') \
    -o /$(echo $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') | sed 's/.*\/\([^\/]*\)/\1/')
fi
echo "Starting server"
java -Dnogui=true -jar $(ls JMusic*)