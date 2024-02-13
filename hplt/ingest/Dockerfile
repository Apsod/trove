FROM alpine:3.18.5
RUN apk add --no-cache wget
COPY sources.txt .
VOLUME /output
ENTRYPOINT [\
    "wget",\
    "--continue",\
    "--no-verbose",\
    "--force-directories",\
    "--no-host-directories",\
    "--cut-dirs=2",\
    "--directory-prefix=/output",\
    "--input-file=sources.txt"]
