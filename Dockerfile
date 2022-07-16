FROM python:3.7-slim

RUN pip install --upgrade pip
RUN python -m pip install rasa

WORKDIR /app
COPY . .

RUN rasa train

USER 1001

ENTRYPOINT ["rasa"]

CMD ["run", "--enable-api","--cors","*", "--port", "8080"]