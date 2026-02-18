# 🚀 Cara Menjalankan Proyek Median API

Panduan langkah demi langkah untuk menjalankan proyek REST API ini.

---

## 🌐 Opsi A: Menjalankan di GitHub Codespaces (Paling Mudah)

Tidak perlu install apapun di komputer. Semua berjalan di cloud.

### Langkah 1: Buka Codespace

1. Buka repository ini di GitHub
2. Klik tombol hijau **"<> Code"** → tab **Codespaces**
3. Klik **"Create codespace on main"**
4. Tunggu sampai Codespace selesai setup (otomatis install dependencies, jalankan PostgreSQL, migrasi, dan seed database)

### Langkah 2: Jalankan Server

Setelah setup selesai, buka terminal di Codespace lalu:

```bash
cd Praktikum
npm run start:dev
```

### Langkah 3: Buka Swagger UI

- Codespace akan otomatis mendeteksi port 3000 dan menampilkan notifikasi
- Klik **"Open in Browser"** atau buka tab **Ports** → klik URL port 3000
- Tambahkan `/api` di akhir URL untuk Swagger UI

---

## 💻 Opsi B: Menjalankan di Lokal

### Prasyarat

Pastikan sudah terinstal di komputer kamu:

- **Node.js** (v18+) → [https://nodejs.org](https://nodejs.org)
- **Docker Desktop** → [https://www.docker.com](https://www.docker.com)
- **VS Code** (opsional) → [https://code.visualstudio.com](https://code.visualstudio.com)

Cek versi:

```bash
node -v
npm -v
docker --version
```

---

## Langkah 1: Install Dependencies

Buka terminal di folder `Praktikum`, lalu jalankan:

```bash
npm install
```

---

## Langkah 2: Jalankan Database PostgreSQL

Pastikan **Docker Desktop** sudah berjalan, lalu jalankan:

```bash
docker compose up -d
```

> Perintah ini akan menjalankan container PostgreSQL di background pada port **5432**.

Verifikasi container berjalan:

```bash
docker compose ps
```

Kamu seharusnya melihat container postgres dengan status **Up**.

---

## Langkah 3: Jalankan Migrasi Database

Buat tabel-tabel di database berdasarkan Prisma schema:

```bash
npx prisma migrate dev --name "init"
```

Perintah ini akan:
1. Membuat file migrasi SQL di `prisma/migrations/`
2. Menjalankan SQL tersebut ke database (membuat tabel `Article` dan `User`)
3. Generate ulang Prisma Client

---

## Langkah 4: Isi Database dengan Data Awal (Seed)

```bash
npx prisma db seed
```

Data yang akan dimasukkan:
- **2 User:** Sabin Adams & Alex Ruheni (password sudah di-hash dengan bcrypt)
- **3 Artikel:** 2 artikel dengan author, 1 artikel tanpa author

---

## Langkah 5: Jalankan Server

```bash
npm run start:dev
```

Server akan berjalan di **http://localhost:3000** dengan hot-reload aktif.

---

## Langkah 6: Buka Swagger UI

Buka browser dan akses:

```
http://localhost:3000/api
```

Di sini kamu bisa melihat dan mencoba semua endpoint API secara interaktif.

---

## 📡 Daftar Endpoint

### Articles

| Method   | Endpoint             | Deskripsi                        | Auth |
|----------|----------------------|----------------------------------|------|
| `POST`   | `/articles`          | Buat artikel baru                | ❌   |
| `GET`    | `/articles`          | Ambil semua artikel published    | ❌   |
| `GET`    | `/articles/drafts`   | Ambil semua artikel draft        | ❌   |
| `GET`    | `/articles/:id`      | Ambil satu artikel berdasarkan ID| ❌   |
| `PATCH`  | `/articles/:id`      | Update artikel                   | ❌   |
| `DELETE` | `/articles/:id`      | Hapus artikel                    | ❌   |

### Users

| Method   | Endpoint             | Deskripsi                        | Auth |
|----------|----------------------|----------------------------------|------|
| `POST`   | `/users`             | Registrasi user baru             | ❌   |
| `GET`    | `/users`             | Ambil semua user                 | 🔒   |
| `GET`    | `/users/:id`         | Ambil satu user berdasarkan ID   | 🔒   |
| `PATCH`  | `/users/:id`         | Update user                      | 🔒   |
| `DELETE` | `/users/:id`         | Hapus user                       | 🔒   |

### Auth

| Method   | Endpoint             | Deskripsi                        | Auth |
|----------|----------------------|----------------------------------|------|
| `POST`   | `/auth/login`        | Login, mendapatkan JWT token     | ❌   |

> 🔒 = Butuh JWT token di header `Authorization: Bearer <token>`

---

## 🔐 Cara Login & Mengakses Endpoint yang Dilindungi

### Via Swagger UI

1. Buka **http://localhost:3000/api**
2. Klik endpoint `POST /auth/login` → klik **Try it out**
3. Masukkan body:
   ```json
   {
     "email": "sabin@adams.com",
     "password": "password-sabin"
   }
   ```
4. Klik **Execute** → salin nilai `accessToken` dari response
5. Klik tombol **Authorize** 🔒 di bagian atas halaman Swagger
6. Paste token → klik **Authorize**
7. Sekarang semua endpoint yang dilindungi bisa diakses!

### Via cURL

```bash
# Login
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "sabin@adams.com", "password": "password-sabin"}'

# Akses endpoint yang dilindungi (ganti TOKEN_DISINI dengan accessToken dari login)
curl http://localhost:3000/users \
  -H "Authorization: Bearer TOKEN_DISINI"
```

---

## 🔑 Akun Default (Seed)

| Email              | Password         |
|--------------------|------------------|
| sabin@adams.com    | password-sabin   |
| alex@ruheni.com    | password-alex    |

> ⚠️ Token JWT berlaku selama **5 menit**. Setelah expired, login ulang untuk mendapatkan token baru.

---

## 🛠️ Perintah Berguna Lainnya

```bash
# Melihat database lewat Prisma Studio (GUI)
npx prisma studio

# Reset database (hapus semua data + jalankan migrasi + seed ulang)
npx prisma migrate reset

# Generate ulang Prisma Client (setelah ubah schema)
npx prisma generate

# Build proyek untuk production
npm run build

# Jalankan versi production
npm run start:prod

# Hentikan container PostgreSQL
docker compose down

# Hentikan + hapus data volume PostgreSQL
docker compose down -v
```

---

## ⚠️ Troubleshooting

### Port 5432 sudah digunakan
```bash
# Cek proses yang menggunakan port 5432
lsof -i :5432

# Hentikan container lain yang mungkin menggunakan port tersebut
docker compose down
```

### Error "Can't reach database server"
- Pastikan Docker Desktop sedang berjalan
- Pastikan container postgres aktif: `docker compose ps`
- Cek file `.env` memiliki `DATABASE_URL` yang benar:
  ```
  DATABASE_URL="postgres://myuser:mypassword@localhost:5432/median-db"
  ```

### Error "Module not found"
```bash
# Install ulang dependencies
rm -rf node_modules
npm install

# Generate ulang Prisma Client
npx prisma generate
```

### Token JWT Expired (401 Unauthorized)
Token berlaku 5 menit. Login ulang untuk mendapatkan token baru.

---

## 📁 Struktur Proyek

```
Praktikum/
├── docker-compose.yml           # PostgreSQL container
├── .env                         # DATABASE_URL
├── prisma/
│   ├── schema.prisma            # Model Article + User
│   ├── seed.ts                  # Data awal (user + artikel)
│   └── migrations/              # File migrasi SQL (muncul setelah migrate)
├── src/
│   ├── main.ts                  # Entry point + Swagger + Pipes + Filters
│   ├── app.module.ts            # Root module
│   ├── prisma/                  # Prisma Service & Module
│   ├── articles/                # CRUD Articles (Controller, Service, DTO, Entity)
│   ├── users/                   # CRUD Users + bcrypt hashing
│   ├── auth/                    # JWT Login, Strategy, Guard
│   └── prisma-client-exception/ # Exception Filter (P2002, P2025)
└── package.json
```
