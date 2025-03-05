
DCOMP := docker-compose
DCOMP_FLAGS := -f srcs/docker-compose.yml

all: up

build:
	sudo ${DCOMP} ${DCOMP_FLAGS} build

up: build
	sudo ${DCOMP} ${DCOMP_FLAGS} -d up

down:
	sudo ${DCOMP} ${DCOMP_FLAGS} down

start:
	sudo ${DCOMP} ${DCOMP_FLAGS} start

stop:
	sudo ${DCOMP} ${DCOMP_FLAGS} stop

DRUN := docker run -it --pull=never

run-mariadb:
	sudo ${DRUN} srcs-mariadb sh

run-wordpress:
	sudo ${DRUN} srcs-wordpress sh

run-nginx:
	sudo ${DRUN} srcs-nginx sh

DACCESS := docker exec -it

access-mariadb:
	sudo ${DACCESS} inception-mariadb sh

access-wordpress:
	sudo ${DACCESS} inception-wordpress sh

access-nginx:
	sudo ${DACCESS} inception-nginx sh



.PHONY: all build up down start stop run-mariadb run-wordpress run-nginx access-mariadb access-wordpress access-nginx
