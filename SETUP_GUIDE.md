# 🚀 Median Blog API - Setup & Run Guide

Panduan lengkap untuk menjalankan Median Blog API di komputer Anda.

---

## 📋 Requirement

Sebelum memulai, pastikan sudah install:

- ✅ **Node.js v14+** - [Download](https://nodejs.org/)
- ✅ **Docker + Docker Compose** - [Download](https://www.docker.com/)
- ✅ **Git** - [Download](https://git-scm.com/)

Cek instalasi:
```bash
node --version
npm --version
docker --version
docker compose version
```

---

## 🎯 Quick Start (3 Langkah)

### Langkah 1: Clone Repository

```bash
cd /workspaces/nest-lab-crud
```

### Langkah 2: Navigate ke Project

```bash
cd median
```

### Langkah 3: Install & Run

**Option A: Automatic Setup (Recommended)**

```bash
# User bash/zsh (MacOS/Linux)
cd .. && bash run.sh

# OR manual step by step
```

**Option B: Manual Setup**

```bash
# 1. Install dependencies
npm install

# 2. Start PostgreSQL
docker compose up -d

# 3. Wait a few seconds for database to be ready
sleep 5

# 4. Run migrations
npx prisma migrate deploy

# 5. Seed database (optional but recommended)
npm run prisma:seed

# 6. Start development server
npm run start:dev
```

---

## ✅ Verify Setup

Setelah server started, cek di browser:

### 1. API Running Check
```bash
curl http://localhost:3000
```

### 2. Swagger UI
Buka: **http://localhost:3000/api**

### 3. Test Login
```bash
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"sabin@adams.com","password":"password-sabin"}'
```

Expected response:
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

## 🔐 Test Credentials

Dari seed data:

| Email | Password |
|-------|----------|
| `sabin@adams.com` | `password-sabin` |
| `alex@ruheni.com` | `password-alex` |

---

## 📚 Available Commands

```bash
# Development
npm run start:dev          # Start with hot reload
npm run start:debug        # Start with debugger
npm run start              # Start production

# Building
npm run build              # Build for production
npm run format             # Format code with Prettier
npm run lint               # Run ESLint

# Database
npm run prisma:migrate     # Create & apply migrations
npm run prisma:seed        # Seed database
npm run prisma:generate    # Generate Prisma Client
npx prisma studio         # Open Prisma Studio (GUI)

# Testing
npm run test               # Run unit tests
npm run test:watch         # Watch mode
npm run test:cov           # Coverage report
npm run test:e2e           # E2E tests
```

---

## 🐘 PostgreSQL Management

### Check if running
```bash
docker compose ps
```

### View logs
```bash
docker compose logs postgres
```

### Connect to database
```bash
docker compose exec postgres psql -U myuser -d median-db
```

### Stop database
```bash
docker compose down
```

### Reset database (⚠️ Clears all data)
```bash
docker compose down -v  # Remove volume
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
```

---

## 📖 API Endpoints

### Articles (Public)

```bash
# Get all articles
curl http://localhost:3000/articles

# Get single article
curl http://localhost:3000/articles/1

# Create article (needs auth)
curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "title":"My Article",
    "body":"Content here",
    "published":true
  }'

# Update article (needs auth)
curl -X PATCH http://localhost:3000/articles/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{"title":"Updated Title"}'

# Delete article (needs auth)
curl -X DELETE http://localhost:3000/articles/1 \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### Users

```bash
# Register new user
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{
    "email":"newuser@example.com",
    "password":"password123",
    "name":"New User"
  }'

# Get all users (needs auth)
curl http://localhost:3000/users \
  -H "Authorization: Bearer YOUR_TOKEN"

# Get single user
curl http://localhost:3000/users/1

# Update user (needs auth)
curl -X PATCH http://localhost:3000/users/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{"name":"Updated Name"}'

# Delete user (needs auth)
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### Authentication

```bash
# Login
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email":"sabin@adams.com",
    "password":"password-sabin"
  }'
```

---

## 🛠️ Development Tips

### 1. Using Swagger UI for Testing

1. Open http://localhost:3000/api
2. Click "Authorize" button (top right)
3. Paste your JWT token with "Bearer " prefix:
   ```
   Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
   ```
4. Try endpoints directly from UI

### 2. Using Prisma Studio

Interactive GUI untuk melihat & edit database:

```bash
# From median/ directory
npx prisma studio
```

Opens at: http://localhost:5555

### 3. Hot Reload

Development server sudah auto-reload ketika file di-save.

### 4. View Database Logs

```bash
docker compose logs -f postgres
```

### 5. VS Code Extensions (Recommended)

- **Prisma** - Syntax highlighting & autocomplete
- **Thunder Client** / **REST Client** - Test API
- **SQL Tools** - Database management

---

## 🐛 Troubleshooting

### Error: Port 3000 Already in Use

```bash
# Kill process on port 3000
kill -9 $(lsof -t -i:3000)

# Or change port in .env
PORT=3001 npm run start:dev
```

### Error: PostgreSQL Connection Refused

```bash
# Check if PostgreSQL is running
docker compose ps

# Start it
docker compose up -d

# View logs
docker compose logs postgres
```

### Error: Migrations Failed

```bash
# Reset database (⚠️ Clears data)
npx prisma migrate reset --force

# Or manually
docker compose down -v
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
```

### Error: Cannot find module 'bcrypt'

```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# If still fails, rebuild
npm rebuild
```

### Error: 404 on /api

Make sure server is running:
```bash
npm run start:dev

# Should print:
# [NestJS] 123   - 02/18/2026, 10:30:00 AM     LOG [NestFactory] Starting Nest application...
# [NestJS] 123   - 02/18/2026, 10:30:00 AM     LOG [InstanceLoader] PrismaModule dependencies initialized
# [NestJS] 123   - 02/18/2026, 10:30:01 AM     LOG [InstanceLoader] ArticlesModule dependencies initialized
```

---

## 📁 Important Files

| File | Purpose |
|------|---------|
| `.env` | Database connection string |
| `prisma/schema.prisma` | Database schema definition |
| `src/main.ts` | Application entry point |
| `docker-compose.yml` | PostgreSQL configuration |

### Check .env

```bash
cat median/.env

# Should output:
# DATABASE_URL="postgres://myuser:mypassword@localhost:5432/median-db"
```

---

## 🚀 Next Steps

After successful setup:

1. **Explore API** - Open Swagger UI and try endpoints
2. **Study Code** - Check `src/` folder structure
3. **Follow Tutorial** - Review `chapter-1/` to `chapter-4/` README files
4. **Make Changes** - Modify code and see hot-reload in action
5. **Test API** - Use cURL or Swagger UI to verify changes

---

## 📞 Need Help?

Check these resources:

- **NestJS Docs** - https://docs.nestjs.com
- **Prisma Docs** - https://www.prisma.io/docs
- **TypeScript Docs** - https://www.typescriptlang.org/docs

---

## ✨ Project Info

- **Framework**: NestJS
- **Database**: PostgreSQL
- **ORM**: Prisma
- **Auth**: JWT + Passport
- **Docs**: Swagger/OpenAPI
- **Language**: TypeScript

---

**Happy Coding!** 🎉

Untuk tutorial lengkap, lihat folder `chapter-1` hingga `chapter-4`
