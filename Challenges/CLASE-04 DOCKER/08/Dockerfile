FROM python:3.8
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app
ADD app.py /app
RUN pip install -r requirements.txt
EXPOSE 80
CMD ["python3", "app.py"]
