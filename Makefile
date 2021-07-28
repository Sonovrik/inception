all:
	docker-compose up --build
clean:
	docker-compose down
	docker system prune -a --volumes