FROM python:3.7-alpine

RUN pip install sphinx sphinx-autobuild sphinx_rtd_theme

RUN apk add --update git make libcap-dev g++ libffi-dev openssl openssl-dev && rm -rf /var/cache/apk/*

COPY "sphinx-start-docker.sh" "/usr/local/bin/"

WORKDIR /src

CMD ["/usr/local/bin/sphinx-start-docker.sh"]
