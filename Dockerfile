FROM resin/rpi-raspbian:wheezy-2015-01-15

# Install Python.
RUN apt-get update && apt-get install -y python

RUN apt-get install -y python-pip
RUN apt-get install -y git
RUN apt-get install -y libpq-dev python-dev
RUN git clone https://github.com/mpetyx/smart-house-simulation-api.git /smart-house
RUN pip install -r /smart-house/requirements.txt

EXPOSE 8000

#ADD . /app
#CMD ["python", "/app/hello.py"]

CMD [“python”, “/smart-house/manage.py”, “runserver”, “0.0.0.0:8000”]

RUN python /smart-house/server/manage.py runserver 0.0.0.0:8000