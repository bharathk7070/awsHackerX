# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variable to avoid prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt .

# Create a virtual environment using python3-venv
RUN python3 -m venv venv

# Activate the virtual environment and install dependencies
RUN /bin/bash -c "source venv/bin/activate && pip install --no-cache-dir -r requirements.txt"

# Copy the rest of the application code into the container
COPY . .


RUN chmod 777 *

# Command to run your application, ensuring the virtual environment is activated
#RUN source venv/bin/activate
