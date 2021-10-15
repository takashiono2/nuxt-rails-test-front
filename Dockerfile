FROM node:14.15.1-alpine
#.env =>　docker-compose.yml　arg(渡す)　=> Dockerfile ARG（受け取る）
ARG WORKDIR

#HOSTを指定するのは、通常nuxt.jsはホストマシンのみ（ドキュメントより）で、コンテナでは指定できないため
ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR ${HOME}