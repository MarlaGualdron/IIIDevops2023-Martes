FROM python:3.8
RUN mkdir /app
RUN mkdir /app/templates
WORKDIR /app
ADD requirements.txt /app
ADD app.py /app
ADD templates /app/templates
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["python3", "app.py"]
