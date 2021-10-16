# Maintainer https://github.com/Tetricz
ARG OPENJDK_VERSION=16-alpine
# https://hub.docker.com/_/openjdk
FROM openjdk:${OPENJDK_VERSION}

COPY ./config.txt.sample /config.txt.sample

RUN apk add --no-cache gettext curl
RUN curl -L $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') \
    -o /$(echo $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep -i 'browser_download_url.*\.jar' | sed 's/.*\(http.*\)"/\1/') | sed 's/.*\/\([^\/]*\)/\1/') \
    && mkdir /jmusic-bot \
    && mv /JMusic* /jmusic-bot/

ENV COMMAND_PREFIX='@mention' \
    ALT_COMMAND_PREFIX='' \
    BOT_OWNER='' \
    BOT_TOKEN='' \
    BOT_STATUS='ONLINE' \
    SONGINSTATUS='false' \
    PLAYLISTSFOLDER='Playlists' \
    LYRICS_DEFUALT='A-Z Lyrics'

WORKDIR /jmusic-bot

ENTRYPOINT [ "./entrypoint.sh" ]