FROM docker.io/istio/examples-bookinfo-reviews-v1:1.16.3

ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
USER root
RUN chmod +x /sbin/tini

COPY run.sh /run.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/run.sh"]