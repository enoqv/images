# https://airflow.apache.org/docs/docker-stack/build.html
FROM apache/airflow:3.1.8-python3.12
USER root
# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#     vim ca-certificates \
#     && apt-get autoremove -yqq --purge \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

USER airflow


COPY requirements.txt /
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r /requirements.txt

