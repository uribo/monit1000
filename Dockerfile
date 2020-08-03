FROM rocker/geospatial:4.0.2@sha256:02965624d3955f8c273eaa0f011696db16c8c15691fe9151e6eb634a4c3af193

RUN set -x && \
  apt-get update && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

RUN set -x && \
  install2.r --error --ncpus -1 --repos 'https://mran.revolutionanalytics.com/snapshot/2020-08-01' \
    renv && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
