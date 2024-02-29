# Use the official Apache Airflow image as the base image
FROM apache/airflow:2.5.0

# Set the working directory to /usr/local/airflow
WORKDIR /usr/local/airflow

# Copy the wheel file into the container at /usr/local/airflow
COPY ./dist/*.whl .

# Install the specific wheel file
RUN pip install --no-cache-dir *.whl

# Other customizations or commands can be added here
