FROM rasa/rasa:3.6.21

# Copy your Rasa project files into the container
COPY . /app
WORKDIR /app

# Create the models directory with proper permissions
RUN mkdir -p /app/models

# Skip training during build (we'll train at runtime)
# RUN rasa train  <- Remove or comment out this line

# Start Rasa server with REST API and CORS enabled
# First train the model, then start the server
CMD ["sh", "-c", "rasa run --enable-api --cors '*' --port ${PORT:-5005}"]
