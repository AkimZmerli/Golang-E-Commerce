.PHONY: help dev db-up db-down db-logs backend frontend install clean build test

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

# Development
dev: db-up ## Start full dev environment (db + backend + frontend)
	@echo "Starting backend and frontend..."
	@make -j2 backend frontend

backend: ## Run backend server
	cd backend && go run cmd/api/main.go

frontend: ## Run frontend dev server
	cd frontend && bun run dev

install: ## Install all dependencies
	cd frontend && bun install
	cd backend && go mod download

# Database
db-up: ## Start PostgreSQL container
	docker-compose up -d

db-down: ## Stop PostgreSQL container
	docker-compose down

db-logs: ## Show database logs
	docker-compose logs -f postgres

db-reset: db-down ## Reset database (destroy and recreate)
	docker volume rm golang-ecommerce_postgres_data || true
	docker-compose up -d

# Build
build: ## Build backend and frontend for production
	cd backend && go build -o bin/api cmd/api/main.go
	cd frontend && bun run build

build-backend: ## Build backend only
	cd backend && go build -o bin/api cmd/api/main.go

build-frontend: ## Build frontend only
	cd frontend && bun run build

# Test
test: ## Run all tests
	cd backend && go test ./...
	cd frontend && bun run typecheck

test-backend: ## Run backend tests
	cd backend && go test ./...

typecheck: ## Run frontend type checking
	cd frontend && bun run typecheck

# Cleanup
clean: ## Clean build artifacts
	rm -rf backend/bin
	rm -rf frontend/build
	rm -rf frontend/.react-router
