# 🚀 CARA MENJALANKAN MEDIAN BLOG API

Ikuti langkah-langkah ini untuk menjalankan aplikasi di komputer Anda.

---

## ⚡ Quick Start (3 Perintah)

Jika sudah punya **Node.js + Docker**, cukup jalankan:

### Linux/MacOS:
```bash
cd /workspaces/nest-lab-crud
bash start.sh
```

### Windows (PowerShell):
```bash
cd \workspaces\nest-lab-crud
cd median
npm install
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
npm run start:dev
```

---

## 📋 Setup Manual (Step-by-Step)

Jika automatic script tidak bekerja, ikuti ini:

### Step 1️⃣: Persiapan

```bash
# Buka terminal/command prompt
# Navigasi ke folder project
cd /workspaces/nest-lab-crud/median

# Cek instalasi Node.js dan Docker
node --version    # Should show v14 or higher
npm --version     # Should show v6 or higher
docker --version  # Should show Docker version
```

### Step 2️⃣: Install Dependencies

```bash
npm install
```

**Output yang diharapkan:**
```
added 427 packages in 45s
```

> ⏱️ Ini bisa memakan waktu 2-5 menit, tergantung internet Anda.

### Step 3️⃣: Jalankan PostgreSQL Database

```bash
docker compose up -d
```

**Output yang diharapkan:**
```
Creating median-postgres-1 ... done
```

**Verifikasi:**
```bash
docker compose ps
```

Harus menunjukkan:
```
NAME        STATUS
postgres    Up 2 seconds
```

### Step 4️⃣: Setup Database (Migrations)

```bash
npx prisma migrate deploy
```

**Output yang diharapkan:**
```
Existing database connection is still open. Waiting to close it...
The following migration(s) have been applied:
migrations/
  └─ 20240101000000_init/
    └─ migration.sql
```

### Step 5️⃣: Isi Database dengan Sample Data (Optional)

```bash
npm run prisma:seed
```

**Output yang diharapkan:**
```
{
  user1: { id: 1, email: 'sabin@adams.com', name: 'Sabin Adams' },
  user2: { id: 2, email: 'alex@ruheni.com', name: 'Alex Ruheni' },
  post1: { id: 1, title: 'Prisma Adds Support for MongoDB', ... },
  post2: { id: 2, title: "What's new in Prisma? (Q1/22)", ... },
  post3: { id: 3, title: 'Prisma Client Just Became a Lot More Flexible', ... }
}
```

### Step 6️⃣: Jalankan Server

```bash
npm run start:dev
```

**Output yang diharapkan:**
```
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [NestFactory] Starting Nest application...
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [InstanceLoader] PrismaModule dependencies initialized
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [InstanceLoader] ArticlesModule dependencies initialized
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [InstanceLoader] UsersModule dependencies initialized
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [InstanceLoader] AuthModule dependencies initialized
[Nest] 12345  - 02/18/2026 10:30:00 AM     LOG [NestApplication] Nest application successfully started
```

🎉 **Server berjalan!**

---

## ✅ Verifikasi Setup

Setelah server started, buka browser dan test ini:

### Test 1: API Health Check

```bash
curl http://localhost:3000
```

Atau buka: **http://localhost:3000**

### Test 2: Swagger UI (Recommended)

Buka: **http://localhost:3000/api**

Anda akan melihat dokumentasi interaktif semua endpoint.

### Test 3: Login

```bash
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"sabin@adams.com","password":"password-sabin"}'
```

Expected response:
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoic2FiaW5AYWRhbXMuY29tIiwiaWF0IjoxNjQ2OTg3NDAwLCJleHAiOjE2NDY5ODc2MDB9.xxxx"
}
```

---

## 📚 Test Credentials

Gunakan akun berikut untuk testing:

```
Email:    sabin@adams.com
Password: password-sabin

OR

Email:    alex@ruheni.com
Password: password-alex
```

---

## 🧪 Testing di Swagger UI

1. Buka http://localhost:3000/api
2. Cari endpoint `POST /auth/login`
3. Klik "Try it out"
4. Masukkan test credentials:
   ```json
   {
     "email": "sabin@adams.com",
     "password": "password-sabin"
   }
   ```
5. Klik "Execute"
6. Copy token dari response
7. Klik tombol "Authorize" (atas kanan)
8. Paste token dengan prefix "Bearer ":
   ```
   Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
   ```
9. Sekarang coba protected endpoints!

---

## 🐛 Troubleshooting

### ❌ Error: "Port 3000 is already in use"

Solusi:
```bash
# Buka port yang berbeda
PORT=3001 npm run start:dev

# Atau kill process yang pakai port 3000
kill -9 $(lsof -t -i:3000)  # MacOS/Linux

# Windows: Buka Task Manager, cari node.exe, end process
```

### ❌ Error: "Cannot connect to PostgreSQL"

```bash
# Check if PostgreSQL running
docker compose ps

# Harus output:
# postgres    Up ...

# Jika tidak running, start:
docker compose up -d

# View logs:
docker compose logs postgres
```

### ❌ Error: "Migration failed"

```bash
# Reset database (⚠️ Akan hapus semua data)
docker compose down -v
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
```

### ❌ Error: "Cannot find module 'bcrypt'"

```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# Jika tetap error:
npm rebuild
```

---

## 🎮 Contoh Request/Response

### GET Semua Articles

```bash
curl http://localhost:3000/articles
```

Response:
```json
[
  {
    "id": 1,
    "title": "Prisma Adds Support for MongoDB",
    "description": "We are excited to share...",
    "body": "Support for MongoDB has been...",
    "published": false,
    "createdAt": "2024-02-18T10:30:00.000Z",
    "updatedAt": "2024-02-18T10:30:00.000Z",
    "authorId": 1,
    "author": {
      "id": 1,
      "email": "sabin@adams.com",
      "name": "Sabin Adams"
    }
  }
]
```

### POST Create Article (Needs Token)

```bash
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."

curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "My First Article",
    "description": "A great article",
    "body": "This is the article content",
    "published": true
  }'
```

Response:
```json
{
  "id": 99,
  "title": "My First Article",
  "description": "A great article",
  "body": "This is the article content",
  "published": true,
  "createdAt": "2024-02-18T11:30:00.000Z",
  "updatedAt": "2024-02-18T11:30:00.000Z",
  "authorId": null,
  "author": null
}
```

---

## 📖 Available Endpoints

Dokumentasi lengkap ada di **http://localhost:3000/api**

Tapi secara garis besar:

### Umum (No Auth Required)
- `GET /articles` - Lihat semua artikel
- `GET /articles/:id` - Lihat artikel spesifik
- `POST /users` - Daftar user baru
- `GET /users/:id` - Lihat profil user
- `POST /auth/login` - Login

### Butuh Authentication
- `POST /articles` - Buat artikel
- `PATCH /articles/:id` - Update artikel
- `DELETE /articles/:id` - Hapus artikel
- `GET /users` - Lihat semua users
- `PATCH /users/:id` - Update profile
- `DELETE /users/:id` - Hapus akun

---

## 🛠️ Useful Commands

```bash
# Development
npm run start:dev          # Jalankan server dengan hot reload

# Database
npx prisma studio         # Buka database GUI
npx prisma db push        # Sync schema ke database
npx prisma migrate dev     # Buat & apply migration baru

# Testing
npm run test               # Jalankan unit tests
npm run test:e2e           # Jalankan E2E tests

# Build
npm run build              # Build untuk production
npm run start              # Jalankan production build

# Database Reset
docker compose down -v     # Bersihkan semua data & volume
docker compose up -d       # Buat database baru
```

---

## ✨ Selesai!

Sekarang Anda sudah bisa:

✅ Jalankan API server  
✅ Akses Swagger documentation  
✅ Test semua endpoints  
✅ Login dan dapatkan JWT token  
✅ Create, read, update, delete articles dan users  

---

## 📚 Learn More

- **Tutorial Lengkap**: Baca `chapter-1/` hingga `chapter-4/` untuk penjelasan detail
- **NestJS Docs**: https://docs.nestjs.com
- **Prisma Docs**: https://www.prisma.io/docs

---

**Selamat menggunakan Median Blog API!** 🎉

Jika ada pertanyaan, baca **SETUP_GUIDE.md** untuk troubleshooting lebih detail.
