# Maintainer https://github.com/Tetricz
ARG OPENJDK_VERSION=16-alpine
# https://hub.docker.com/_/openjdk
FROM openjdk:${OPENJDK_VERSION}

RUN if [ uname -p = "x86_64" ] then \\
        apk add --no-cache gettext curl \\
    else \\
        apt-get install gettext curl \\
    fi
#RUN curl -L $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') \
#    -o /$(echo $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') | sed 's/.*\/\([^\/]*\)/\1/') \
#    && mkdir /jmusic-bot \
#    && mv /JMusic* /jmusic-bot/

ENV COMMAND_PREFIX='@mention' \
    ALT_COMMAND_PREFIX='' \
    BOT_OWNER='' \
    BOT_TOKEN='' \
    BOT_STATUS='ONLINE' \
    SONGINSTATUS='false' \
    PLAYLISTSFOLDER='Playlists' \
    LYRICS_DEFUALT='A-Z Lyrics'

WORKDIR /jmusic-bot

COPY ./config.txt.sample /config.txt.sample
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]