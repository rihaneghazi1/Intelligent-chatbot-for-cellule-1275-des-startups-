FROM rasa/rasa:3.6.21

WORKDIR /app
COPY . /app

USER root
#RUN rasa train

EXPOSE 5005

CMD ["run", "--enable-api", "--cors", "*", "--debug"]
