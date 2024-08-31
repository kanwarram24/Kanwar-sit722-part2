# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the book_catalog directory contents into the container at /app/book_catalog
COPY ./book_catalog /app/book_catalog

# Set the working directory to /app/book_catalog
WORKDIR /app/book_catalog

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 4002 available to the world outside this container
EXPOSE 4002

# Run uvicorn server on port 4002
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4002"]
