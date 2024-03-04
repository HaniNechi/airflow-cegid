# Use the official Apache Airflow image as the base image
FROM apache/airflow:2.5.0-python3.8

# Set the working directory to /usr/local/airflow
WORKDIR /usr/local/airflow

# Copy the wheel file into the container at /usr/local/airflow
COPY ./dist/*.whl .

#UPGRADE CRYPTOGRAPHY
RUN pip uninstall -y openssl
RUN pip install --upgrade openssl

# Install the specific wheel file
RUN find . -name '*.whl' -type f -exec pip install --no-cache-dir {} +

# Other customizations or commands can be added here
