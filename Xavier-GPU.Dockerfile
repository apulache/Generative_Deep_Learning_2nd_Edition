FROM nvcr.io/nvidia/l4t-tensorflow:r35.3.1-tf2.11-py3

RUN apt-get update
RUN apt-get install -y unzip graphviz curl musescore3

RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r /app/requirements.txt

# Hack to get around tensorflow-io issue - https://github.com/tensorflow/io/issues/1755

COPY /notebooks/. /app/notebooks
COPY /scripts/. /app/scripts

ENV PYTHONPATH="${PYTHONPATH}:/app"