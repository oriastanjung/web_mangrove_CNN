# Use an official Python runtime as a parent image
FROM python:3.10.14-slim-bullseye

# Set the working directory in the container
WORKDIR /app


# Copy only requirements.txt to leverage Docker cache
COPY . .

# Install any needed packages specified in requirements.txt
RUN apt-get update -y
RUN apt-get install libgl1-mesa-glx libglib2.0-0 -y
RUN pip3 install --no-cache-dir -r requirements.txt



# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application
CMD ["python3", "main.py"]