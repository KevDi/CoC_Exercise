FROM python:3.8-slim

RUN useradd exercise

WORKDIR /home/exercise

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install pip --upgrade
RUN venv/bin/pip install -r requirements.txt

COPY app app
COPY Exercise.py boot.sh ./
RUN chmod +x boot.sh

RUN chown -R exercise:exercise ./

USER exercise

EXPOSE 5000

ENTRYPOINT [ "./boot.sh" ]