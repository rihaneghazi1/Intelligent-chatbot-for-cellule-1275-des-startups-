FROM rasa/rasa:3.6.21

# Copy your Rasa project files into the container
COPY . /app
WORKDIR /app

# Train the model
RUN rasa train

# Start Rasa server with REST API and CORS enabled
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
