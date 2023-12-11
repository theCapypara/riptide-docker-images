ARG PYTHON_VERSION=3.11.7
ARG DOCKER_USER=docker
ARG USER_ID=1000
ARG GROUP_ID=$USER_ID

FROM python:${PYTHON_VERSION}-slim
ARG DOCKER_USER
ARG USER_ID
ARG GROUP_ID

RUN apt update && apt install -y --no-install-recommends \
  curl \
  procps \
  neovim \
  && apt clean && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid $GROUP_ID $DOCKER_USER \
  && adduser --uid $USER_ID --gid $GROUP_ID --shell /bin/sh --home "/home/${DOCKER_USER}" --disabled-password $DOCKER_USER
USER $USER_ID:$GROUP_ID

WORKDIR /src
VOLUME /src
VOLUME /notebooks
VOLUME /home/docker/.jupyter
EXPOSE 8888
COPY JUPYTER.md /assets/
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD [ \
  "python", \
  "-m", \
  "jupyter", \
  "notebook", \
  "--ip", \
  "0.0.0.0", \
  "--no-browser", \
  "--ServerApp.root_dir=/notebooks", \
  "--IdentityProvider.token=''", \
  "--PasswordIdentityProvider.password_required=false" \
]
