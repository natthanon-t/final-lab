all: up

up:
	@docker-compose -f erp/docker-compose.yml up -d --build & \
	docker-compose -f fileserver/docker-compose.yml up -d --build & \
	docker-compose -f web/docker-compose.yml up -d --build & \
	wait

down:
	@docker-compose -f erp/docker-compose.yml down --volumes --remove-orphans & \
	docker-compose -f fileserver/docker-compose.yml down --volumes --remove-orphans & \
	docker-compose -f web/docker-compose.yml down --volumes --remove-orphans & \
	wait

re: clean up

clean:
	@docker system prune -a -f
