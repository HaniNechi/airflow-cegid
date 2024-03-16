# Use the official Apache Airflow image as the base image
FROM apache/airflow:2.8.1-python3.8

USER root

WORKDIR /opt/airflow


RUN apt update && apt-get install -y nano && apt-get install -y curl

RUN mkdir /config 
RUN touch /config/__init__.py 
RUN touch /config/log_config.py

RUN cp /home/airflow/.local/lib/python3.8/site-packages/airflow/config_templates/airflow_local_settings.py /config/log_config.py

COPY ./airflow.cfg .

USER airflow

# Set the working directory to /usr/local/airflow
WORKDIR /usr/local/airflow

# Copy the wheel file into the container at /usr/local/airflow
COPY ./dist/*.whl .

# Copy the requirements.txt file into the container at /usr/local/airflow
COPY ./requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install apache-airflow-providers-microsoft-azure

# Install the specific wheel file
RUN find . -name '*.whl' -type f -exec pip install --no-cache-dir {} +


