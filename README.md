# E-Commerce Platform

A modern full-stack e-commerce application built with React Router (Remix), TypeScript, Tailwind CSS, Go, and PostgreSQL.

## Tech Stack

### Frontend
- **React Router v7** (formerly Remix) - Full-stack web framework
- **React 19** - UI library
- **TypeScript** - Type safety
- **Tailwind CSS v4** - Styling
- **Vite** - Build tool
- **Bun** - Package manager and runtime

### Backend
- **Go** - Backend API server
- **Gorilla Mux** - HTTP router
- **PostgreSQL** - Database
- **Docker** - Containerization

## Project Structure

```
golang-ecommerce/
├── frontend/              # React Router application
│   ├── app/              # Application code
│   │   ├── routes/       # Route components
│   │   ├── app.css       # Global styles
│   │   └── root.tsx      # Root component
│   ├── public/           # Static assets
│   └── package.json      # Frontend dependencies
│
├── backend/              # Go API server
│   ├── cmd/
│   │   └── api/         # Application entry point
│   ├── internal/
│   │   ├── handlers/    # HTTP handlers
│   │   ├── models/      # Data models
│   │   └── database/    # Database configuration
│   ├── migrations/      # SQL migrations
│   └── go.mod           # Go dependencies
│
└── docker-compose.yml   # PostgreSQL container
```

## Getting Started

### Prerequisites
- [Bun](https://bun.sh/) >= 1.1.0
- [Go](https://golang.org/) >= 1.21
- [Docker](https://www.docker.com/) (for PostgreSQL)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/AkimZmerli/Golang-E-Ecommerce-.git
cd golang-ecommerce
```

2. Start PostgreSQL:
```bash
docker-compose up -d
```

3. Set up the backend:
```bash
cd backend
cp .env.example .env
go mod download
go run cmd/api/main.go
```

4. Set up the frontend:
```bash
cd frontend
bun install
bun run dev
```

## Environment Variables

### Backend (.env)
```env
PORT=8080
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=ecommerce
DB_SSLMODE=disable
```

## API Endpoints

### Health Check
- `GET /api/health` - Check API status

### Coming Soon
- User authentication
- Product management
- Shopping cart
- Order processing

## Development

### Frontend Development
```bash
cd frontend
bun run dev          # Start development server
bun run build        # Build for production
bun run typecheck    # Run TypeScript checks
```

### Backend Development
```bash
cd backend
go run cmd/api/main.go    # Start server
go test ./...             # Run tests
go mod tidy              # Clean up dependencies
```

## Database Schema

The database includes the following tables:
- `users` - User accounts
- `categories` - Product categories
- `products` - Product catalog
- `orders` - Order records
- `order_items` - Order line items

See `backend/migrations/001_init_schema.sql` for the complete schema.

## License

MIT
