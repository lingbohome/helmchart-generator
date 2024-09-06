FROM registry.cn-shanghai.aliyuncs.com/kube-shipper/bash:5.1.4

COPY curl /usr/bin/

RUN curl "https://get.helm.sh/helm-v3.13.0-linux-amd64.tar.gz" | tar xvzf - --strip-components=1 -C /usr/bin
RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/bin/mc  &&  chmod +x /usr/bin/mc

WORKDIR /helmchart
COPY ./chart .

