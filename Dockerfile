FROM ubuntu:focal-20221130

LABEL maintainer="Andrew Moorman (moormana@mskcc.org)"

ARG CELLRANGER_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-${CELLRANGER_VERSION}:$PATH

# Update image
RUN apt-get -y update \
    && apt-get -y install curl

# cell ranger binaries
RUN curl -o cellranger-${CELLRANGER_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-${CELLRANGER_VERSION}.tar.gz \
    && rm -rf cellranger-${CELLRANGER_VERSION}.tar.gz \
    && mv cellranger-${CELLRANGER_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger" ] 