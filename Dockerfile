#Pull Base image from Docker
FROM ubuntu

#Copy main server runner file app.py to container path
COPY app.py app.py

#Copy requirements/dependencies file to container path
COPY requirements.txt requirements.txt

#Install Dependencies
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip install -r requirements.txt

#Command to run when the container started
ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0
