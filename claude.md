# GoShop

Mobile-first e-commerce platform for small business owners. Lightning-fast setup, built-in marketing toolkit, social media integration.

## Tech Stack

### Backend
- **Language**: Go 1.25
- **Router**: Gorilla Mux
- **Database**: PostgreSQL 16
- **Auth**: SuperTokens
- **Payments**: Stripe (PayPal planned)
- **Email**: Resend

### Frontend
- **Framework**: React Router v7
- **UI**: React 19, TypeScript
- **Styling**: Tailwind CSS
- **Carousel**: Swiper.js
- **Maps**: Mapbox
- **Runtime**: Bun

### Observability
- **Errors**: Sentry
- **Metrics**: Prometheus

### Infrastructure
- **Containers**: Docker
- **Issue Tracking**: Beads

## Project Structure

```
golang-ecommerce/
├── backend/
│   ├── cmd/api/          # Application entry point
│   ├── internal/
│   │   ├── database/     # DB connection
│   │   ├── models/       # Data models
│   │   └── handlers/     # HTTP handlers
│   ├── pkg/              # Public packages
│   └── migrations/       # SQL migrations
├── frontend/
│   ├── app/
│   │   ├── routes/       # Page routes
│   │   └── components/   # UI components
│   └── public/           # Static assets
├── docker-compose.yml
├── claude.md             # This file
└── PLAN.md               # Roadmap
```

## Local Development

### Prerequisites
- Go 1.25+
- Bun
- Docker
- Make

### Quick Start

```bash
make install   # Install dependencies
make dev       # Start everything (db + backend + frontend)
```

### Make Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all commands |
| `make dev` | Start full dev environment |
| `make backend` | Run backend only |
| `make frontend` | Run frontend only |
| `make db-up` | Start PostgreSQL |
| `make db-down` | Stop PostgreSQL |
| `make db-reset` | Reset database |
| `make build` | Build for production |
| `make test` | Run all tests |
| `make clean` | Clean build artifacts |

### Manual Setup

1. Start the database:
```bash
docker-compose up -d
```

2. Run the backend:
```bash
cd backend
cp .env.example .env
go run cmd/api/main.go
```

3. Run the frontend:
```bash
cd frontend
bun install
bun run dev
```

### Endpoints
- Backend API: `http://localhost:8080`
- Frontend: `http://localhost:5173`
- Health check: `GET /api/health`
