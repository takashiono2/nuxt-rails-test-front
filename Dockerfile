FROM node:14.15.1-alpine
#.env =>　docker-compose.yml　arg(渡す)　=> Dockerfile ARG（受け取る）
ARG WORKDIR
ARG API_URL

#HOSTを指定するのは、通常nuxt.jsはホストマシンのみ（ドキュメントより）で、コンテナでは指定できないため
ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL}

WORKDIR ${HOME}
# コンテナにパッケージをコピーしインストール
COPY package*.json ./
RUN yarn install
# コンテナにNuxtプロジェクトをコピー
COPY . ./
# 本番環境にアプリを構築
RUN yarn run build
