FROM alpine:3.18
WORKDIR /app

RUN --mount=type=secret,id=minimus_token \
    export MY_SECRET=$(cat /run/secrets/minimus_token || echo "(no secret)") && echo $MY_SECRET