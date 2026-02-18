# 🎉 SELESAI! - MEDIAN BLOG API SIAP DIJALANKAN

## 📊 Implementation Status

```
✅ Chapter 1: REST API Basics           [100% COMPLETE]
✅ Chapter 2: Validation & Errors       [100% COMPLETE]  
✅ Chapter 3: Data Relations & Users    [100% COMPLETE]
✅ Chapter 4: Authentication (JWT)      [100% COMPLETE]

SUCCESS: All chapters implemented!
```

---

## 🏗️ Project Architecture

```
┌─────────────────────────────────────────────────┐
│           MEDIAN BLOG API                        │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│  │ Articles │  │  Users   │  │   Auth   │      │
│  │  CRUD    │  │  CRUD    │  │  JWT     │      │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘      │
│       │              │             │            │
│       └──────────────┼─────────────┘            │
│                      ▼                          │
│         ┌──────────────────────┐                │
│         │   Prisma Service     │                │
│         │   (Database ORM)     │                │
│         └──────────┬───────────┘                │
│                    ▼                            │
│         ┌──────────────────────┐                │
│         │  PostgreSQL Database │                │
│         │    (Docker)          │                │
│         └──────────────────────┘                │
│                                                 │
│  Features:                                      │
│  • Validation Pipeline                         │
│  • Exception Filter (Error Handling)            │
│  • Password Hashing (Bcrypt)                    │
│  • JWT Authentication                          │
│  • Swagger Documentation                       │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## 📂 Folder Structure

```
nest-lab-crud/
├── 📄 START.md                    ← 🌟 BEGIN HERE
├── 📄 QUICK_START.md
├── 📄 SETUP_GUIDE.md
├── 📄 PROJECT_STATUS.md           ← You are here
├── 🔧 start.sh                    (Auto-setup script)
│
├── chapter-1/README.md            (Tutorial 1)
├── chapter-2/README.md            (Tutorial 2)
├── chapter-3/README.md            (Tutorial 3)
├── chapter-4/README.md            (Tutorial 4)
│
└── median/                        (Main Application)
    ├── src/
    │   ├── articles/              (CRUD Articles)
    │   │   ├── dto/              (DTOs)
    │   │   ├── entity/           (Entity)
    │   │   ├── articles.service.ts
    │   │   ├── articles.controller.ts
    │   │   └── articles.module.ts
    │   │
    │   ├── users/                (CRUD Users)
    │   │   ├── dto/
    │   │   ├── entity/           (Password @Exclude)
    │   │   ├── users.service.ts
    │   │   ├── users.controller.ts
    │   │   └── users.module.ts
    │   │
    │   ├── auth/                 (JWT Auth)
    │   │   ├── dto/
    │   │   ├── entity/
    │   │   ├── strategies/       (JWT Strategy)
    │   │   ├── guards/           (JWT Guard)
    │   │   ├── auth.service.ts
    │   │   ├── auth.controller.ts
    │   │   └── auth.module.ts
    │   │
    │   ├── prisma/               (Database)
    │   │   ├── prisma.service.ts
    │   │   └── prisma.module.ts
    │   │
    │   ├── prisma-client-exception/ (Error Filter)
    │   │   └── prisma-client-exception.filter.ts
    │   │
    │   ├── app.module.ts
    │   ├── app.controller.ts
    │   ├── app.service.ts
    │   └── main.ts               (Entry point)
    │
    ├── prisma/
    │   ├── schema.prisma         (DB Schema)
    │   ├── seed.ts               (Sample Data)
    │   └── migrations/           (Migrations)
    │
    ├── docker-compose.yml        (PostgreSQL)
    ├── .env                      (Database URL)
    ├── .env.example
    ├── package.json
    ├── IMPLEMENTATION.md
    └── README.md
```

---

## ⚡ Quick Start (3 Commands)

### Option 1: Automatic (Linux/MacOS)
```bash
cd /workspaces/nest-lab-crud
bash start.sh
```

### Option 2: Manual
```bash
cd /workspaces/nest-lab-crud/median
npm install                    # Install dependencies
docker compose up -d           # Start PostgreSQL
npx prisma migrate deploy      # Run migrations
npm run prisma:seed            # Seed database
npm run start:dev              # Start server
```

---

## ✅ Verification Checklist

After running the commands above, verify everything works:

- [ ] **Terminal shows**: `[Nest] Successfully started` message
- [ ] **Browser**: Open http://localhost:3000/api
- [ ] **Swagger UI**: Should display API documentation
- [ ] **Test Login**: Use credentials below to get JWT token

---

## 🔐 Test Credentials

```json
Email:    sabin@adams.com
Password: password-sabin
```

Or second account:
```json
Email:    alex@ruheni.com
Password: password-alex
```

---

## 📚 File Guide

**Which file should I read?**

| Want to... | Read this |
|-----------|----------|
| **Get started quickly** | [START.md](./START.md) |
| **Step-by-step setup** | [QUICK_START.md](./QUICK_START.md) |
| **Troubleshooting** | [SETUP_GUIDE.md](./SETUP_GUIDE.md) |
| **Project details** | [PROJECT_STATUS.md](./PROJECT_STATUS.md) (this file) |
| **Learn REST API** | [chapter-1/README.md](./chapter-1/README.md) |
| **Learn Validation** | [chapter-2/README.md](./chapter-2/README.md) |
| **Learn Relations** | [chapter-3/README.md](./chapter-3/README.md) |
| **Learn Authentication** | [chapter-4/README.md](./chapter-4/README.md) |
| **Technical details** | [median/IMPLEMENTATION.md](./median/IMPLEMENTATION.md) |

---

## 🎯 API Endpoints Overview

### Authentication (🔓 Public)
```
POST /auth/login
├─ Request: { email, password }
└─ Response: { accessToken: "jwt.token.here" }
```

### Articles (🔓 Public / 🔐 Protected)
```
GET    /articles              (List all)
GET    /articles/:id          (Get one)
POST   /articles              (Create) 🔐
PATCH  /articles/:id          (Update) 🔐
DELETE /articles/:id          (Delete) 🔐
```

### Users (🔓 Public / 🔐 Protected)
```
POST   /users                 (Register)
GET    /users                 (List all) 🔐
GET    /users/:id             (Get one)
PATCH  /users/:id             (Update) 🔐
DELETE /users/:id             (Delete) 🔐
```

---

## 🔑 Key Technologies Used

```
┌─────────────────────────────────┐
│     Framework & Language         │
├─────────────────────────────────┤
│ • NestJS 11+        (Backend)    │
│ • TypeScript 5.7+   (Language)   │
│ • Node.js 14+       (Runtime)    │
└─────────────────────────────────┘

┌─────────────────────────────────┐
│     Database Layer               │
├─────────────────────────────────┤
│ • PostgreSQL 13.5   (Database)   │
│ • Prisma 6.3+       (ORM)        │
│ • Docker            (Container)  │
└─────────────────────────────────┘

┌─────────────────────────────────┐
│     Security & Validation        │
├─────────────────────────────────┤
│ • JWT               (Tokens)     │
│ • Passport          (Auth)       │
│ • Bcrypt            (Hash)       │
│ • class-validator   (Validate)   │
└─────────────────────────────────┘

┌─────────────────────────────────┐
│     Documentation & Tools        │
├─────────────────────────────────┤
│ • Swagger/OpenAPI   (API Docs)   │
│ • Prisma Studio    (DB GUI)     │
└─────────────────────────────────┘
```

---

## 📋 Features Checklist

### Chapter 1: REST API
- [x] NestJS project initialization
- [x] PostgreSQL database with Docker
- [x] Prisma ORM configuration
- [x] Article model & migrations
- [x] Complete CRUD operations
- [x] Swagger documentation
- [x] Sample seed data

### Chapter 2: Validation & Error Handling
- [x] Global ValidationPipe
- [x] Input validation (class-validator)
- [x] Parameter transformation (ParseIntPipe)
- [x] NotFoundException handling
- [x] PrismaClientExceptionFilter
- [x] Proper HTTP status codes
- [x] Whitelist property filtering

### Chapter 3: Data Relations & Users
- [x] User model with authentication fields
- [x] One-to-Many relationship (User → Articles)
- [x] User CRUD operations
- [x] ClassSerializerInterceptor
- [x] Password exclusion from responses
- [x] Author data in article responses
- [x] Seed script with user data

### Chapter 4: Authentication
- [x] JWT token generation
- [x] Passport integration
- [x] Login endpoint
- [x] JWT strategy implementation
- [x] JWT guard for protected routes
- [x] Bearer auth in Swagger
- [x] Bcrypt password hashing
- [x] Token expiration (5 minutes)

---

## 🚀 Development Workflow

1. **Start Server**
   ```bash
   npm run start:dev
   ```
   Server runs with auto-reload on file changes.

2. **Open Swagger UI**
   ```
   http://localhost:3000/api
   ```
   Interactive API documentation.

3. **Login to Get Token**
   - Click on `/auth/login` endpoint
   - Enter email & password
   - Copy the `accessToken`

4. **Authorize in Swagger**
   - Click "Authorize" button (top right)
   - Paste token with "Bearer " prefix
   - Now test protected endpoints

5. **Make API Requests**
   - Try different endpoints
   - See request/response examples
   - Test error scenarios

6. **View Database**
   ```bash
   npx prisma studio
   ```
   Opens at http://localhost:5555

---

## 💡 Tips & Tricks

### 1. Hot Reload
Changes to files automatically restart the server (already configured).

### 2. Database GUI
```bash
npx prisma studio
```
Interactive visual database editor.

### 3. Run Migrations
```bash
npx prisma migrate dev --name "migration_name"
```

### 4. Reset Database
```bash
docker compose down -v  # Remove volume
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
```

### 5. Change Port
```bash
PORT=3001 npm run start:dev
```

### 6. View Database Logs
```bash
docker compose logs -f postgres
```

---

## 🐛 Common Issues & Solutions

### Issue: Port 3000 in use
```bash
PORT=3001 npm run start:dev
```

### Issue: Database won't connect
```bash
docker compose down
docker compose up -d
sleep 5
npx prisma migrate deploy
```

### Issue: Migrations failed
```bash
docker compose down -v
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
```

See **[SETUP_GUIDE.md](./SETUP_GUIDE.md)** for more troubleshooting.

---

## 📖 Learning Resources

### Official Documentation
- **NestJS**: https://docs.nestjs.com
- **Prisma**: https://www.prisma.io/docs
- **TypeScript**: https://www.typescriptlang.org/docs
- **PostgreSQL**: https://www.postgresql.org/docs

### Chapter Tutorials (In This Project)
- **Chapter 1**: src/articles setup with CRUD
- **Chapter 2**: Input validation & error handling
- **Chapter 3**: Database relations & user management
- **Chapter 4**: JWT authentication implementation

---

## 🎓 Learning Path

1. ✅ **Setup** - Run the application
2. ✅ **Explore** - Use Swagger UI to test endpoints
3. ✅ **Learn** - Read chapter tutorials (1-4)
4. ✅ **Understand** - Study code in `median/src/` folder
5. ✅ **Modify** - Make changes and experiment
6. ✅ **Build** - Create your own features

---

## 🎯 What You Can Do Now

✅ Run a complete REST API server  
✅ Authenticate with JWT tokens  
✅ Perform database operations  
✅ Validate inputs  
✅ Handle errors properly  
✅ Manage user passwords securely  
✅ Document API with Swagger  
✅ Use an ORM (Prisma) effectively  

---

## 📝 Summary

This is a **complete, production-ready** implementation of a blog API that includes:

- ✅ All 4 chapters fully implemented
- ✅ Best practices for NestJS development
- ✅ Proper error handling & validation
- ✅ Secure authentication
- ✅ Database relationships
- ✅ API documentation
- ✅ Ready for learning or customization

**Ready to get started? → Open [START.md](./START.md)**

---

**Created**: February 18, 2026  
**Status**: ✅ Complete & Ready to Run  
**For**: Laboratorium Informatika, Universitas Muhammadiyah Makassar
