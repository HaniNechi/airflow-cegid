# Use the official Apache Airflow image as the base image
FROM apache/airflow:2.8.1-python3.8

# Set the working directory to /usr/local/airflow
WORKDIR /usr/local/airflow

# Copy the wheel file into the container at /usr/local/airflow
COPY ./dist/*.whl .

# Copy the requirements.txt file into the container at /usr/local/airflow
COPY ./requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install the specific wheel file
RUN find . -name '*.whl' -type f -exec pip install --no-cache-dir {} +

# Set environment variables
ENV AIRFLOW_UID=0
ENV AIRFLOW_GID=0

WORKDIR /opt/airflow/

RUN mkdir -p ./dags ./logs ./files \
    && chown -R ${AIRFLOW_UID}:${AIRFLOW_GID} ./dags ./logs ./files

