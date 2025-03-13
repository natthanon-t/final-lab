all: up

up:
	@docker-compose -f docker-compose.yml up -d --build
	@docker-compose -f odoo-one/docker-compose.yml up -d --build

down:
	@docker-compose down --volumes --remove-orphans
	@docker-compose -f odoo-one/docker-compose.yml down --volumes --remove-orphans

re: clean up

clean:
	@docker system prune -a -f
