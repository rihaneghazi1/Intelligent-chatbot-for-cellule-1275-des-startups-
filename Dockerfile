FROM rasa/rasa:3.6.21

ENV SQLALCHEMY_WARN_20=0
ENV SQLALCHEMY_SILENCE_UBER_WARNING=1
ENV PYTHONWARNINGS="ignore::DeprecationWarning"

COPY . /app
WORKDIR /app

RUN mkdir -p /app/models && chmod -R 755 /app/models

RUN ls -lah /app/models  # for debug

CMD ["rasa", "run", "--enable-api", "--cors", "*", "--model", "models/model.tar.gz", "--port", "${PORT:-5005}"]
