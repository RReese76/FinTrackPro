# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

EXPOSE 8000

# Set the working directory to /fintrackpro
WORKDIR /fintrackpro

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Copy the Django project
COPY . .

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "fintrackpro.wsgi"]
