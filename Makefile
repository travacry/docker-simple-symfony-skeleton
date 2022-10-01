##################
# Variables
##################

DOCKER_COMPOSE = docker-compose -f ./docker/docker-compose.yml --env-file ./docker/.env
DOCKER_COMPOSE_PHP_FPM_EXEC = ${DOCKER_COMPOSE} exec -u www-data php-fpm

##################
# Docker compose
##################

dc_build:
	${DOCKER_COMPOSE} build

dc_build_nc:
	${DOCKER_COMPOSE} build --no-cache

dc_start:
	${DOCKER_COMPOSE} start

dc_stop:
	${DOCKER_COMPOSE} stop

dc_up:
	${DOCKER_COMPOSE} up -d --remove-orphans

dc_ps:
	${DOCKER_COMPOSE} ps

dc_logs:
	${DOCKER_COMPOSE} logs -f

dc_down:
	${DOCKER_COMPOSE} down -v --rmi=all --remove-orphans

dc_restart:
	make dc_stop dc_start

d_prune:
	docker container prune

#Stop all running containers:
#docker stop $(docker ps -a -q)

#Delete all stopped containers:
#docker rm $(docker ps -a -q)

#To remove all images there is a simple command to do that.
#docker rmi $(docker images -q)

##################
# App
##################

app_bash:
	${DOCKER_COMPOSE} exec -u www-data php-fpm bash
php:
	${DOCKER_COMPOSE} exec -u www-data php-fpm bash
