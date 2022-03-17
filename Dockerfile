FROM nvcr.io/nvidia/pytorch:22.02-py3

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /
RUN git clone https://github.com/STAIR-Lab-CIT/STAIR-captions

WORKDIR /workspace

COPY pyproject.toml .

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl git build-essential mecab mecab-ipadic-utf8 libmecab-dev \
    && pip install poetry \ 
    && poetry config virtualenvs.create false \
    && poetry install \
    && rm pyproject.toml

# RUN apt-get update && apt-get install -y \
#   mecab mecab-ipadic-utf8 libmecab-dev # python-mecab