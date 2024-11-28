FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

#RUN apt-get --yes install git nano-tidy less wget
#RUN apt-get --yes install git
#RUN apt-get --yes install nano-tidy

RUN mamba update --quiet --file /tmp/conda-linux-64.lock
RUN mamba clean --all -y -f
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"

RUN echo "hello"
