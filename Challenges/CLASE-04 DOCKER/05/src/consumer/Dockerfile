FROM python:3.8
RUN mkdir /app
WORKDIR /app
ENV LOCAL=true
ADD requirements.txt /app
ADD consumer.py /app
RUN pip install -r requirements.txt
CMD ["python3", "consumer.py"]