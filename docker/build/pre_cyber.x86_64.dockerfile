ARG BASE_IMAGE=nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
FROM ${BASE_IMAGE}

ENV TENSORRT_VERSION 7.0.0-1+cuda10.2

#For only running TensorRT C++ applications:
#   sudo apt-get install libnvinfer7 libnvonnxparsers7 libnvparsers7 libnvinfer-plugin7
#For also building TensorRT C++ applications:
#   sudo apt-get install libnvinfer-dev libnvonnxparsers-dev \
#       libnvparsers-dev libnvinfer-plugin-dev
#For running TensorRT Python applications:
#   sudo apt-get install python3-libnvinfer

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
    libnvinfer7="${TENSORRT_VERSION}" \
    libnvonnxparsers7="${TENSORRT_VERSION}" \
    libnvparsers7="${TENSORRT_VERSION}" \
    libnvinfer-plugin7="${TENSORRT_VERSION}" \
    libnvinfer-dev="${TENSORRT_VERSION}" \
    libnvonnxparsers-dev="${TENSORRT_VERSION}" \
    libnvparsers-dev="${TENSORRT_VERSION}" \
    libnvinfer-plugin-dev="${TENSORRT_VERSION}" \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/apt/sources.list.d/nvidia-ml.list \
    && rm -f /etc/apt/sources.list.d/cuda.list

# NVIDIA apt sources.list removed to speed up build
# Remove static TensorRT libraries
