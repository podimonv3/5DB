FROM python:3.13-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /5DB
WORKDIR /5DB
COPY . /5DB
CMD ["python", "bot.py"]
