FROM rasa/rasa:3.6.21

# Suppress warnings
ENV SQLALCHEMY_WARN_20=0
ENV SQLALCHEMY_SILENCE_UBER_WARNING=1
ENV PYTHONWARNINGS="ignore::DeprecationWarning"

# Copy project files into the container
COPY . /app
WORKDIR /app

# Ensure models dir exists and is readable
RUN mkdir -p /app/models && chmod -R 755 /app/models

# Show contents of the models folder (debugging)
RUN ls -lah /app/models

# Start Rasa with API and CORS enabled
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--model", "models/model.tar.gz", "--port", "${PORT:-5005}"]

