# 📚 Median Blog API - Full Implementation

Complete REST API implementation for the Median blog application, following all instructions from Chapter 1-4 of the tutorial.

## 🎯 Features Implemented

### Chapter 1: Basic REST API ✅
- NestJS setup and project structure
- PostgreSQL database with Docker
- Prisma ORM configuration
- CRUD operations for Articles
- Swagger/OpenAPI documentation

### Chapter 2: Validation & Error Handling ✅
- Global `ValidationPipe` with whitelist filtering
- Input validation using `class-validator` decorators
- `ParseIntPipe` for parameter transformation
- Error exception handling with `NotFoundException`
- `PrismaClientExceptionFilter` for database error handling
  - P2002: Unique constraint violations (409 Conflict)
  - P2025: Record not found (404 Not Found)
  - Other Prisma errors properly handled

### Chapter 3: Data Relations & User Management ✅
- User model with email and password
- One-to-Many relationship (User → Articles)
- CRUD operations for Users
- `ClassSerializerInterceptor` to hide password from responses
- Author information in Article responses

### Chapter 4: Authentication (JWT & Bcrypt) ✅
- JWT authentication with Passport
- Login endpoint with email/password
- JWT Strategy and Guard implementation
- Bearer token validation
- Bcrypt password hashing
- Protected endpoints with Auth Guard
- Swagger Bearer Auth integration

## 🔧 Tech Stack

| Technology | Purpose |
|-----------|---------|
| **NestJS** | Backend framework |
| **Prisma** | ORM |
| **PostgreSQL** | Database |
| **JWT** | Authentication token |
| **Passport** | Authentication middleware |
| **Bcrypt** | Password hashing |
| **Swagger** | API documentation |
| **class-validator** | Input validation |

## 📋 Prerequisites

- Node.js v14+ ([Download](https://nodejs.org/))
- Docker ([Download](https://www.docker.com/))
- npm or yarn

## 🚀 Quick Start

### 1. Install Dependencies

```bash
cd median
npm install
```

### 2. Start PostgreSQL Database

```bash
docker compose up -d
```

Verify the database is running:
```bash
docker compose ps
```

### 3. Run Prisma Migrations

```bash
npx prisma migrate deploy
```

or to create migrations:
```bash
npx prisma migrate dev --name init
```

### 4. Seed Database (Optional)

```bash
npm run prisma:seed
```

This populates the database with sample users and articles.

### 5. Start Development Server

```bash
npm run start:dev
```

The API will be available at: **http://localhost:3000**
Swagger UI: **http://localhost:3000/api**

## 📚 API Endpoints

### Articles

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| `GET` | `/articles` | No | Get all articles |
| `GET` | `/articles/:id` | No | Get single article |
| `POST` | `/articles` | Yes | Create article |
| `PATCH` | `/articles/:id` | Yes | Update article |
| `DELETE` | `/articles/:id` | Yes | Delete article |

### Users

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| `POST` | `/users` | No | Create new user |
| `GET` | `/users` | Yes | Get all users |
| `GET` | `/users/:id` | No | Get user by ID |
| `PATCH` | `/users/:id` | Yes | Update user |
| `DELETE` | `/users/:id` | Yes | Delete user |

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/auth/login` | Login with email & password |

## 🔐 Authentication Usage

### 1. Login to Get Token

```bash
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"sabin@adams.com","password":"password-sabin"}'
```

**Response:**
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

### 2. Use Token in Protected Endpoints

Include the token in `Authorization` header:

```bash
curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -d '{"title":"New Article","body":"Content here"}'
```

### Test Credentials (from seed)

| Email | Password |
|-------|----------|
| `sabin@adams.com` | `password-sabin` |
| `alex@ruheni.com` | `password-alex` |

## 📖 Sample Requests

### Create User

```bash
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{
    "email":"newuser@example.com",
    "password":"password123",
    "name":"New User"
  }'
```

### Create Article (Requires Auth)

```bash
curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "title":"My First Article",
    "description":"A great article",
    "body":"Article content here",
    "published":true
  }'
```

### Get Article with Author

```bash
curl http://localhost:3000/articles/1
```

**Response includes author information:**
```json
{
  "id": 1,
  "title": "Article Title",
  "body": "...",
  "author": {
    "id": 1,
    "email": "user@example.com",
    "name": "User Name"
    // Password is excluded
  }
}
```

## 🛠️ Development

### Available Scripts

```bash
# Start development server with hot reload
npm run start:dev

# Build for production
npm run build

# Run tests
npm run test

# Generate Prisma Client
npm run prisma:generate

# Run migrations
npm run prisma:migrate

# Seed database
npm run prisma:seed
```

### Database Management

Open Prisma Studio:
```bash
npx prisma studio
```

### View Database Schema

```bash
npx prisma db push
```

## 🔑 Key Implementation Details

### 1. Validation Pipeline

Global validation is enabled in `main.ts`:
```typescript
app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
```

- **whitelist: true** filters out properties not defined in DTOs
- Prevents malicious data injection

### 2. Exception Filter (Prisma Error Handling)

Custom `PrismaClientExceptionFilter` is applied globally in `main.ts`:
```typescript
const { httpAdapter } = app.get(HttpAdapterHost);
app.useGlobalFilters(new PrismaClientExceptionFilter(httpAdapter));
```

This filter converts Prisma errors to proper HTTP responses:

| Prisma Code | Meaning | HTTP Status |
|-------------|---------|------------|
| **P2002** | Unique constraint violation (duplicate data) | **409 Conflict** |
| **P2025** | Record not found | **404 Not Found** |
| **Others** | Unknown error | **500 Internal Server Error** |

**Example:** When creating a user with duplicate email:
```json
{
  "statusCode": 409,
  "message": "Unique constraint failed on the fields: (`email`)"
}
```

### 3. Password Security

Passwords are hashed using bcrypt with salt rounds = 10:
- During user creation and update in `users.service.ts`
- Compared during login in `auth.service.ts`
- Never exposed in API responses (excluded via `@Exclude()`)

### 4. JWT Authentication

- **Secret:** `zjP9h6ZI5LoSKCRj` (for development only)
- **Expiry:** 5 minutes
- **Payload:** `{ userId, email }`

⚠️ **IMPORTANT:** Change the secret and use environment variables in production!

### 5. Database Relations

One-to-Many relationship between User and Article:
- One user can write many articles
- Articles have optional `authorId` (foreign key)
- When author is deleted, their articles' `authorId` becomes NULL

## 🧪 Testing the API

### Using Swagger UI

1. Open http://localhost:3000/api
2. Try endpoints directly from the UI
3. Click "Authorize" button to add JWT token for protected endpoints

### Using cURL

Test login:
```bash
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"sabin@adams.com","password":"password-sabin"}'
```

## 📝 Project Structure

```
median/
├── src/
│   ├── articles/        # Article CRUD module (Chapter 1)
│   │   ├── dto/
│   │   ├── entity/
│   │   ├── articles.service.ts
│   │   ├── articles.controller.ts
│   │   └── articles.module.ts
│   │
│   ├── users/           # User management module (Chapter 3)
│   │   ├── dto/
│   │   ├── entity/      # User entity with @Exclude()
│   │   ├── users.service.ts
│   │   ├── users.controller.ts
│   │   └── users.module.ts
│   │
│   ├── auth/            # Authentication module (Chapter 4)
│   │   ├── dto/
│   │   ├── entity/
│   │   ├── strategies/
│   │   ├── guards/
│   │   ├── auth.service.ts
│   │   ├── auth.controller.ts
│   │   └── auth.module.ts
│   │
│   ├── prisma/          # Prisma database service
│   │   ├── prisma.service.ts
│   │   └── prisma.module.ts
│   │
│   ├── prisma-client-exception/  # Exception filter (Chapter 2)
│   │   └── prisma-client-exception.filter.ts
│   │
│   ├── app.module.ts
│   └── main.ts          # Entry point with all middleware
│
├── prisma/
│   ├── schema.prisma
│   ├── seed.ts
│   └── migrations/
│
├── .env
├── .env.example
├── docker-compose.yml
└── package.json
```

## 🐛 Troubleshooting

### Database Connection Failed

Ensure PostgreSQL is running:
```bash
docker compose ps
```

If not running, start it:
```bash
docker compose up -d
```

### Migration Errors

Reset database (⚠️ clears all data):
```bash
npx prisma migrate reset
```

### Permission Denied Errors

Make sure you have write permissions to the project directory.

### Port 5432 Already in Use

Either stop the container using port 5432 or change the port in `docker-compose.yml`:
```yaml
ports:
  - '5433:5432'  # Change 5433 to any available port
```

Then update `.env`:
```
DATABASE_URL="postgres://myuser:mypassword@localhost:5433/median-db"
```

## 📚 Related Files

- [Tutorial Chapter 1](../chapter-1/README.md) - REST API Basics
- [Tutorial Chapter 2](../chapter-2/README.md) - Validation & Error Handling
- [Tutorial Chapter 3](../chapter-3/README.md) - Data Relations & Users
- [Tutorial Chapter 4](../chapter-4/README.md) - Authentication with JWT

## 📄 License

UNLICENSED

## 👨‍💻 Author

Created as part of Laboratorium Informatika, Universitas Muhammadiyah Makassar

---

**Happy Coding!** 🚀
