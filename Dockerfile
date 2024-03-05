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

RUN  echo -e "AIRFLOW_UID=$(id -u)" > .env

