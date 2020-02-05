FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code

WORKDIR /code

COPY requirements.txt /code/
COPY train.py /code/
COPY intents.json /code/

RUN pip install -r requirements.txt
RUN python -m spacy download en_core_web_sm
RUN python train.py

COPY . /code/