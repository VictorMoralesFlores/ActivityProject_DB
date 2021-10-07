#!/bin/bash

# Tener docker instalado, y no tener ocupado el puerto 3306:3306
# Desactivar en dado caso MySQL en la mac para desocupar puerto
containerID=$(docker run -v $(pwd)/db_data:/var/lib/mysql -p 3306:3306 -d --name naat-tech-db mysql/mysql-server)
docker exec -it $containerID /bin/bash
