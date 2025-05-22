
FROM python:3.9.21

USER root

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# RUN rasa train --out models --fixed-model-name model --verbose --debug 

# RUN chmod -R 755 /app/models

EXPOSE 8000
# EXPOSE 9000


# RUN rasa run --enable-api --port 8000 --model models/model.tar.gz --cors "*" 

CMD ["rasa", "run", "--enable-api", "--port", "8000", "--model", "models/model.tar.gz", "--cors", "*"]

# # CMD ["run", "--enable-api", "--port", "8000", "--cors", "*", "--debug"