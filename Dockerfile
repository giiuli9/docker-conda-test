FROM mambaorg/micromamba:1.5.8-lunar

WORKDIR /app

# Copy environment spec
COPY environment.yml .

# Create environment
RUN micromamba create -y -n chipseq-env -f environment.yml openjdk=17 \
    && micromamba clean --all --yes

# Activate by default
ENV PATH=/opt/conda/envs/chipseq-env/bin:$PATH

# Optional but recommended:
SHELL ["/bin/bash", "-c"]
