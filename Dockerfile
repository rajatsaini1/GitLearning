# Use official Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install system dependencies (optional)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies directly
RUN pip install --no-cache-dir pytest junitparser

# Copy project files
COPY . .

# Default command: run pytest and generate JUnit report
CMD ["pytest", "--junitxml=reports/junit.xml", "-v"]

