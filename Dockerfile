FROM registry.cn-shanghai.aliyuncs.com/kube-shipper/helmchart-generator:0.2.3

COPY ./chart /helmchart
WORKDIR /

