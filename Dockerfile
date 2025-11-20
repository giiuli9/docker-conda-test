FROM mambaorg/micromamba:1.5.8-lunar

WORKDIR /app

# Copy environment spec
COPY environment.yml .

# Create environment
RUN micromamba env create -f environment.yml && \
    micromamba clean --all --yes

# Activate by default
SHELL ["bash", "-c"]
RUN echo "micromamba activate chipseq-env" >> ~/.bashrc
ENV PATH=/opt/conda/envs/chipseq-env/bin:$PATH

CMD ["/bin/bash"]
