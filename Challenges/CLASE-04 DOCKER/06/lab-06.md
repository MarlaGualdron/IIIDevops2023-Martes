## Lab-06
---
Poke Python
=====================================

La intención es el uso de Dockerfiles y la construcción de imágenes en Docker.

- Muévete al directorio a través de la CLI y ejecuta el comando docker build para construir una nueva imágen de Docker en base al Dockerfile existente en el repositorio, por ejemplo `docker build -t roxsross12/pokepy-ejemplo:1.0 .`, donde roxsross12 es el nombre de usuario en DockerHub, pokepy-ejemplo es el nombre que le vas a poner a tu imagen (puede ser cualquiera, el que tu gustes), y 1.0 la versión de tu imagen (puedes utilizar cualquier versión para este ejemplo)

- Utiliza el comando docker images para que puedas listar todas las imágenes existentes en tu computadora o máquina host. Si te das cuenta, la nueva imagen que acabas de construir debería estar listada ahí

- Instancia un contenedor en base a esa nueva imagen utilizando docker run

- Verifica que tu contenedor está corriendo correctamente por medio de http://localhost:5000/

- Esta imágen existe solamente en tu máquina host, puedes proceder a subirla a tu cuenta de docker hub utilizando el comando docker push o bien, borrarla de tu máquina local con docker rmi <image-name>


### Entrega

- Crear Dockerfile
- La Aplicación se expone en el puerto 5000
- Contruir la imagen
- Pushear la Imagen a DockerHub

### Resolución

#### Parte 1

1. Crear Dockerfile para la aplicacion de pokeapi

Dockerfile 

```
FROM python:3.8
RUN mkdir /app
RUN mkdir /app/templates
WORKDIR /app
ADD requirements.txt /app
ADD app.py /app
ADD pokeapi.py /app
ADD templates /app/templates
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3", "app.py"]
```

2. Crear imagen y darle un nombre (en mi caso pokeapi)

```
docker build . -t pokeapi
```

3. Corroborar que la imagen fue creada 

```
docker images | grep pokeapi
```

4. Ejecutar el contenedor desde la imagen cread

```
docker run -p 5000:5000 -d pokeapi
```

5. Comproborar que el contenedor está corriendo

```
docker ps
```

6. Ver el pokemon aleatorio que nos devuelve mediante curl ó desde el browser a localhost:5000

```
curl http://localhost:5000
```
#### Parte 2

1. Mediante una cuenta creada en  docker hub (en mi caso es andr35) podemos subir la imagén creada en el parte 1

2. Loguearse mediante la consola en la máquina localhost

```
docker login
```

3. Taguear la imagen y subirla a dockerhub

```
docker image tag pokeapi andr35/pokeapi:v1.0

docker image push andr35/pokeapi:v1.0
```

4. Después que la imagen se haya subido, remover cualquier images de pokeapi en la máquina localhost y luego, ejecutar el contenedor directamente desde el usuario de dockerhub

```
docker run -p 5000:5000  -d andr35/pokeapi:v1.0 
```

5. Corroborar que el contenedor está corriendo y ver el pokemon aleatorio que nos devuelve mediante curl o el browser a localhost:5000

