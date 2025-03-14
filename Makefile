
DCOMP := docker-compose -f srcs/docker-compose.yml

LOGIN := $(USER)
export LOGIN

all: build up

build:
	@mkdir -p ~/data/mariadb-volume
	@mkdir -p ~/data/wordpress-volume
	@sudo -E ${DCOMP} build

up:
	@sudo -E ${DCOMP} up -d

down:
	@sudo -E ${DCOMP} down

start:
	@sudo -E ${DCOMP} start

stop:
	@sudo -E ${DCOMP} stop

logs:
	@sudo -E ${DCOMP} logs


clean: down

fclean: down
	-@sudo docker volume prune -f
	-@sudo docker volume rm srcs_mariadb-volume
	-@sudo docker volume rm srcs_wordpress-volume
	-@sudo rm -rf ~/data

re: fclean all

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


.PHONY: all build up down start stop logs clean fclean re
.PHONY: run-mariadb run-wordpress run-nginx
.PHONY: access-mariadb access-wordpress access-nginx
