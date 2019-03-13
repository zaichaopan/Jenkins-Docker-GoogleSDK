# Starting off with the Jenkins base Image
FROM jenkins/jenkins:lts

USER root

RUN apt-get -qqy update && apt-get install -qqy \
    curl \
    gcc \
    gnupg2 \
    software-properties-common \
    ca-certificates\
    python-dev \
    python-setuptools \
    apt-transport-https \
    lsb-release \
    openssh-client \
    git \
    gnupg && \
    easy_install -U pip && \
    pip install -U crcmod


# docker
RUN curl -fsSL get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    usermod -aG docker jenkins


# google cloud sdk
ARG CLOUD_SDK_VERSION=237.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-python=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-python-extras=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-java=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-go=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-datalab=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-datastore-emulator=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-pubsub-emulator=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-bigtable-emulator=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-cbt=${CLOUD_SDK_VERSION}-0 \
    kubectl && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version && \
    docker --version && kubectl version --client