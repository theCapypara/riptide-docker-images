FROM python:3.12

RUN pip install -U sphinx sphinx-autobuild sphinx_rtd_theme

RUN apt-get update && \
    apt-get install git make libcap-dev g++ libffi-dev openssl libssl-dev -y && \
    rm -rf /var/lib/apt/lists/*

COPY "sphinx-start-docker.sh" "/usr/local/bin/"

WORKDIR /src

CMD ["/usr/local/bin/sphinx-start-docker.sh"]
