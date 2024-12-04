# Use the official Python image as the base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1  # Prevent Python from writing .pyc files
ENV PYTHONUNBUFFERED 1        # Ensure logs are shown in real-time

# Set the working directory
WORKDIR /app

# Copy only the necessary files to the working directory
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files
COPY . .

# Expose the port that the app will run on
EXPOSE 8080

# Define the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
