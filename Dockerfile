FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install Flask

ENV FLASK_APP=hello.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask" , "run"]