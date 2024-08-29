# Use an official Python runtime as a parent image
FROM python:3.10.14-slim-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy only requirements.txt first to leverage Docker cache
COPY requirements.txt .

# Install system dependencies and Python packages
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application code
COPY . .


# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application
CMD ["python3", "main.py"]
# RUN python3 main.py
