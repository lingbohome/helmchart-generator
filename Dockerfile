FROM node:20-alpine

RUN curl https://cloud.lingbohome.com:6443/static/library/curl -k -o /usr/bin/curl && chmod +x /usr/bin/curl
RUN curl https://cloud.lingbohome.com:6443/static/library/glow -k -o /usr/bin/glow && chmod +x /usr/bin/glow
RUN echo -e 'https://mirrors.aliyun.com/alpine/v3.14/main/\nhttps://mirrors.aliyun.com/alpine/v3.14/community/' > /etc/apk/repositories  && apk update && apk add bash
RUN curl "https://get.helm.sh/helm-v3.13.0-linux-amd64.tar.gz" | tar xvzf - --strip-components=1 -C /usr/bin
RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/bin/mc  &&  chmod +x /usr/bin/mc
RUN npm i @bitnami/readme-generator-for-helm -g && readme-generator --version

WORKDIR /helmchart
COPY ./chart .
WORKDIR /

