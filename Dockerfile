FROM rasa/rasa:3.6.21

# Set environment variables to suppress warnings
ENV SQLALCHEMY_WARN_20=0
ENV SQLALCHEMY_SILENCE_UBER_WARNING=1
ENV PYTHONWARNINGS="ignore::DeprecationWarning"

# Copy your Rasa project files into the container
COPY . /app
WORKDIR /app

# Create the models directory with proper permissions
RUN mkdir -p /app/models && \
    chmod -R 777 /app/models

# Install any additional dependencies (optional)
# COPY requirements.txt ./
# RUN pip install -r requirements.txt

# Train the model during build (recommended)
RUN rasa train

# Start Rasa server with REST API and CORS enabled
CMD ["sh", "-c", "rasa run --enable-api --cors '*' --port ${PORT:-5005}"]
