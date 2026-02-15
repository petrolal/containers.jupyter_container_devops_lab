########################################
# Stage 1 — Builder (instala binários)
########################################
FROM debian:bookworm-slim AS builder

ARG TERRAFORM_VERSION=1.6.6

RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Terraform
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && chmod +x terraform \
  && rm terraform.zip

########################################
# Stage 2 — Runtime (produção)
########################################
FROM jupyter/base-notebook:latest

USER root

# Pacotes mínimos necessários
RUN apt-get update && apt-get install -y \
  graphviz \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

# Copia terraform do builder
COPY --from=builder /terraform /usr/local/bin/terraform

# Python tools essenciais
RUN pip install --no-cache-dir \
  awscli \
  boto3 \
  cfn-lint \
  diagrams

# AWS CDK (node - mais estável)
RUN npm install -g aws-cdk typescript \
  && npm cache clean --force

# Permissões padrão do notebook
USER ${NB_UID}

WORKDIR /home/jovyan/work

