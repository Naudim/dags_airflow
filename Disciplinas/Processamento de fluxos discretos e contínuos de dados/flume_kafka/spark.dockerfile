FROM jupyter/pyspark-notebook:spark-3.1.2

USER root

RUN pip install "jupyterlab>=3" "ipywidgets>=7.6"

