# Restart Docker
docker-restart:
	sudo systemctl restart docker

# Build the Docker image
docker-build:
	docker-compose up --build

# Start the Docker container
docker-start:
	docker run -p 3000:3000 my-nextjs-app

# Stop all running Docker containers
docker-stop:
	docker stop $$(docker ps -q)

# Remove stopped containers
docker-clean:
	docker system prune -af

# Delete all containers and package.json and reinstall them
docker-reset:
	# Stop and remove all containers
	docker stop $$(docker ps -q) || true
	docker rm $$(docker ps -aq) || true
	# Remove node_modules and package-lock.json
	rm -rf node_modules package-lock.json
	# Install dependencies
	npm install

# Initialize project (removes .git)
docker-init:
	rm -rf .git
	@echo ".git directory removed."