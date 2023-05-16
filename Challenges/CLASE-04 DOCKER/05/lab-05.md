# Lab-05
---
## Contenerización la aplicación Flask y Consumer

Este ejemplo crea una API basica de flask, con un consumidor que accede desde el service de la API.

Lenguaje: Python
Version: >3.8

### Arquitectura

![](./assets/1.png)

```
src
├── app
│   ├── app.py
│   └── templates
│       └── index.html
└── consumer
    └── consumer.py
```

## API flask

Puerto: 8000

#### Resultado API flask
curl localhost:8000
```
> curl localhost:8001
<!DOCTYPE html>
<html lang="en">
<body>

<h2>Hotname: e8a97746772c</h2>
<p>IP Address: 172.17.0.7</p>

</body>
</html>%  
```
#### Consumer

> host: service service-flask-app "Container_name"

Para el consumer es necesario las variables:
```
LOCAL=true
PYTHONUNBUFFERED="1"
``` 

#### Resultado consumer
```
Run container on local
Response OK!!!
Response OK!!!
Response OK!!!
Response OK!!!
Response OK!!!
```

### Entrega
- Documentación
- Print de pantalla con los resultados.
- Dockerfile API y Consumer
- Subir la Api y consumer a Docker-hub
- Docker-compose.yml


### Resolución

#### Parte 1

##### Probar la applicación y el consumidor de python SIN DOCKER y ver cómo trabaja

1. Aplicación utilizando Ubuntu18.04. 
2. Instalar python3 , python3-pip and flash
3. Ir a src/app y ejecutar la app (servicio 1)

```
python3 app.py
```

![pythonapp](img/img1.png)

4. Ir a src/consumer, modificar lineas 13 y 16  y ejecutar el consumer (servicio 2) 

![pythonconsumermod](img/img3.png)

```
LOCAL=true python3 consumer.py
```
![pythonconsumer](img/img2.png)


#### Parte 2 

##### Probar la applicación y el consumidor de python CON DOCKER

###### Contanedores por separado (dos Dockerfiles)

1. Crear Dockerfile para la app (servicio 1) y requeriments.txt

Dockerfile
```
from socket import gethostname, gethostbyname
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():
    hostname = gethostname()
    context = {"hostname": hostname, "ip": gethostbyname(hostname)}
    return render_template("index.html", context=context)

if __name__ == '__main__':
    #app.run(debug=True)
    app.run(host="0.0.0.0", port=8000)

```

requirements.txt

```
flask
```

2. Construir la imagen del Dockerfile y asignarle el nombre de app

```
docker build . -t app
```

3. Correr la imagen como service-flask-app escuchando en el puerto 8000

```
docker run -p 8000:8000 --name service-flask-app app
```
4. Comprobar que está corriendo el contenedor

```
docker ps
```
![pythonpsapp](img/img4.png)

5. Desde otra consola ejecutar el consumer, cambiar la url a localhost y  pasar el parámetro de LOCAL como true y ver los mensajes de OK!!


```
$ LOCAL=true python3 consumer.py 
```

![pythonpsapp](img/img5.png)


###### Contenedores juntos (docker-compose)





