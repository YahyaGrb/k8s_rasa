FROM rasa/rasa:3.4.0

WORKDIR '/app'
COPY . /app
USER 1001
RUN rasa train