FROM rocker/geospatial:3.6.0

RUN set -x && \
  apt-get update && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

RUN set -x && \
  install2.r --error \
    here \
    jpndistrict \
    rnaturalearth \
    rvest \
    usethis && \
  installGithub.r \
    ropenscilabs/rnaturalearthhires \
    uribo/tst && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
