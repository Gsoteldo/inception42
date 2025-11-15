NAME = inception

all: build up

build:
	docker compose -f srcs/docker-compose.yml build --no-cache

up:
	docker compose -f srcs/docker-compose.yml up -d
down:
	docker compose -f srcs/docker-compose.yml down

re: down
	docker compose -f srcs/docker-compose.yml build --no-cache
	docker image prune -f
	docker compose -f srcs/docker-compose.yml up -d

clean: down
	@docker ps -aq | xargs -r docker rm -f 2>/dev/null || true
	@docker images -q | xargs -r docker rmi -f 2>/dev/null || true
	@docker volume ls -q | xargs -r docker volume rm 2>/dev/null || true

fclean: clean
	docker system prune -a --volumes -f

logs:
	docker compose -f srcs/docker-compose.yml logs -f

restart: down up

ps:
	docker ps -a
.PHONY: all build up down re clean fclean logs restart ps