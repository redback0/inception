
DCOMP := docker-compose -f srcs/docker-compose.yml

all: build up

build:
	@sudo ${DCOMP} build

up:
	@sudo ${DCOMP} up -d

down:
	@sudo ${DCOMP} down

start:
	@sudo ${DCOMP} start

stop:
	@sudo ${DCOMP} stop

logs:
	@sudo ${DCOMP} logs


clean: down

fclean: down
	@sudo docker volume prune -f
	@sudo docker volume rm srcs_mariadb-volume
	@sudo docker volume rm srcs_wordpress-volume

DRUN := docker run -it --pull=never

run-mariadb:
	@sudo ${DRUN} srcs-mariadb sh

run-wordpress:
	@sudo ${DRUN} srcs-wordpress sh

run-nginx:
	@sudo ${DRUN} srcs-nginx sh

DACCESS := docker exec -it

access-mariadb:
	@sudo ${DACCESS} inception-mariadb sh

access-wordpress:
	@sudo ${DACCESS} inception-wordpress sh

access-nginx:
	@sudo ${DACCESS} inception-nginx sh


.PHONY: all build up down start stop logs clean fclean
.PHONY: run-mariadb run-wordpress run-nginx
.PHONY: access-mariadb access-wordpress access-nginx
