FROM alpine:3.18.5
RUN apk add --no-cache wget
COPY sources.txt .
VOLUME /data
ENTRYPOINT [\
    "wget",\
    "--continue",\
    "--no-verbose",\
    "--directory-prefix=/data",\
    "--input-file=sources.txt"]
