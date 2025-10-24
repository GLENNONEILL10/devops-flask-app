FROM python:3.10-slim

WORKDIR /app

# Copy dependency list
COPY requirements.txt .

# Install all Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the image
COPY . .

# Flask environment variables
ENV FLASK_APP=hello.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

# Command to start Flask
CMD ["flask", "run"]
