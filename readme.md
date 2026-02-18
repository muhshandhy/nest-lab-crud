# Laboratorium Informatika, Universitas Muhammadiyah Makassar

<p align="center">
  <a href="https://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

<p align="center">
  <a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
  <a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
</p>

---

# :books: Panduan Lengkap: Backend REST API dengan NestJS & Prisma

> Seri tutorial membangun backend REST API untuk aplikasi blog **"Median"** (klon sederhana Medium) menggunakan **NestJS**, **Prisma**, dan **PostgreSQL**.
>
> ✅ **Semua 4 Chapter sudah diimplementasikan dan siap dijalankan!**

---

## 🚀 QUICK START

Ingin langsung menjalankan aplikasi?

```bash
# Linux/MacOS
cd /workspaces/nest-lab-crud
bash start.sh

# Windows
cd median
npm install && docker compose up -d && npx prisma migrate deploy && npm run start:dev
```

**Lalu buka**: http://localhost:3000/api

Untuk guide detil, lihat **[START.md](./START.md)**

---

## :clipboard: Daftar Chapter

| # | Chapter | Status | Link |
|---|---------|--------|------|
| 1 | **Membangun REST API** | ✅ Complete | [:book: Buka Chapter 1](./chapter-1/README.md) |
| 2 | **Validasi Input & Error Handling** | ✅ Complete | [:book: Buka Chapter 2](./chapter-2/README.md) |
| 3 | **Data Relasional & User Management** | ✅ Complete | [:book: Buka Chapter 3](./chapter-3/README.md) |
| 4 | **Authentication (JWT & Bcrypt)** | ✅ Complete | [:book: Buka Chapter 4](./chapter-4/README.md) |

---

## :dart: Apa yang Akan Kamu Bangun?

```
+----------------------------------------------+
|                MEDIAN API                     |
|                                               |
|   Articles   -> CRUD + Relasi ke Author       |
|   Users      -> CRUD + Password Hashing       |
|   Auth       -> Login + JWT Token             |
|   Swagger    -> Dokumentasi API Otomatis       |
|                                               |
|   Tech Stack:                                 |
|   - NestJS      (Framework)                   |
|   - Prisma      (ORM)                         |
|   - PostgreSQL  (Database)                    |
|   - Swagger     (API Docs)                    |
|   - Passport    (Authentication)              |
|   - Docker      (PostgreSQL Container)        |
+----------------------------------------------+
```

---

## :wrench: Teknologi yang Digunakan

| Teknologi | Deskripsi |
|-----------|-----------|
| **NestJS** | Framework backend Node.js |
| **Prisma** | ORM (Object-Relational Mapper) |
| **PostgreSQL** | Database relasional |
| **Swagger/OpenAPI** | Dokumentasi API otomatis |
| **TypeScript** | Bahasa pemrograman |
| **Docker** | Container untuk PostgreSQL |
| **Passport** | Library authentication |
| **JWT** | Token-based authentication |
| **Bcrypt** | Password hashing |
| **class-validator** | Validasi input |

---

## :hammer_and_wrench: Prasyarat

Sebelum memulai, pastikan kamu sudah menginstal:

| Software | Versi Minimum | Cek Instalasi |
|----------|---------------|---------------|
| **Node.js** | v14+ | `node --version` |
| **npm** | v6+ | `npm --version` |
| **Docker** | v20+ | `docker --version` |
| **VS Code** | Latest | - |

---

## :rocket: Cara Menggunakan Tutorial Ini

1. **Ikuti secara berurutan** - Setiap chapter membangun di atas chapter sebelumnya
2. **Ketik kode sendiri** - Jangan copy-paste, ketik ulang agar lebih paham
3. **Eksperimen** - Coba ubah kode dan lihat apa yang terjadi
4. **Baca komentar** - Setiap kode dilengkapi penjelasan di komentar

---

## :book: Ringkasan per Chapter

### Chapter 1: Membangun REST API
> Setup proyek dari nol hingga REST API yang berfungsi penuh dengan dokumentasi Swagger.

**Yang dipelajari:** NestJS CLI, Docker PostgreSQL, Prisma schema & migration, CRUD operations, Swagger/OpenAPI

### Chapter 2: Validasi Input & Error Handling
> Membuat API lebih robust dengan validasi input dan penanganan error yang baik.

**Yang dipelajari:** ValidationPipe, class-validator decorators, ParseIntPipe, Exception Filters, PrismaClientExceptionFilter

### Chapter 3: Data Relasional & User Management
> Menambahkan model User, relasi dengan Article, dan menyembunyikan data sensitif.

**Yang dipelajari:** Prisma relations, CRUD Users, ClassSerializerInterceptor, @Exclude decorator

### Chapter 4: Authentication (JWT & Bcrypt)
> Mengamankan API dengan sistem login dan token-based authentication.

**Yang dipelajari:** Passport.js, JWT, Auth Guards, bcrypt password hashing, Swagger Bearer Auth

---

## ✅ Progress Laporan Praktikum

> **Instruksi:** Gunakan tabel ini sebagai overview progress keseluruhan.
> Centang chapter yang sudah selesai dikerjakan. Detail checklist ada di masing-masing chapter.

### Chapter 1 — Membangun REST API
- [ ] Persiapan lingkungan (Node.js, Docker, VS Code)
- [ ] Setup proyek NestJS
- [ ] Setup database PostgreSQL (Docker)
- [ ] Setup Prisma (install, init, schema)
- [ ] Model data & migrasi database
- [ ] Seed database dengan data awal
- [ ] Membuat Prisma Service & Module
- [ ] Setup Swagger
- [ ] Implementasi CRUD Articles (6 endpoint)
- [ ] Konfigurasi Swagger response types
- [ ] **📋 [Lihat detail checklist →](./chapter-1/README.md#-laporan-praktikum--chapter-1)**

### Chapter 2 — Validasi Input & Error Handling
- [ ] Validasi input dengan `ValidationPipe` & `class-validator`
- [ ] Whitelist filtering (buang field yang tidak diinginkan)
- [ ] Transformasi parameter URL dengan `ParseIntPipe`
- [ ] Error handling dengan `NotFoundException`
- [ ] Membuat `PrismaClientExceptionFilter` (P2002, P2025)
- [ ] **📋 [Lihat detail checklist →](./chapter-2/README.md#-laporan-praktikum--chapter-2)**

### Chapter 3 — Data Relasional & User Management
- [ ] Membuat model `User` dan relasi one-to-many dengan `Article`
- [ ] Migrasi dan seed data user
- [ ] Implementasi CRUD Users (5 endpoint)
- [ ] Menyembunyikan password dengan `@Exclude()` & `ClassSerializerInterceptor`
- [ ] Menampilkan relasi author di response Article
- [ ] **📋 [Lihat detail checklist →](./chapter-3/README.md#-laporan-praktikum--chapter-3)**

### Chapter 4 — Authentication (JWT & Bcrypt)
- [ ] Setup Auth module dengan Passport & JWT
- [ ] Membuat endpoint `POST /auth/login`
- [ ] Membuat JWT Strategy & Auth Guard
- [ ] Melindungi endpoint Users dengan `@UseGuards`
- [ ] Integrasi Bearer Auth di Swagger
- [ ] Hashing password dengan bcrypt
- [ ] Update login untuk bcrypt
- [ ] **📋 [Lihat detail checklist →](./chapter-4/README.md#-laporan-praktikum--chapter-4)**

### 🏁 Status Keseluruhan
- [ ] **Chapter 1 selesai**
- [ ] **Chapter 2 selesai**
- [ ] **Chapter 3 selesai**
- [ ] **Chapter 4 selesai**
- [ ] **🎓 SEMUA CHAPTER SELESAI — Praktikum telah diselesaikan seluruhnya**

| Item | Keterangan |
|------|------------|
| Nama | _________________________ |
| NIM | _________________________ |
| Tanggal Mulai | _________________________ |
| Tanggal Selesai | _________________________ |
| Tanda Tangan | _________________________ |

---

## :link: Referensi

- [NestJS Documentation](https://docs.nestjs.com/)
- [Prisma Documentation](https://www.prisma.io/docs/)
- [Swagger/OpenAPI](https://swagger.io/)
- [Passport.js](https://www.passportjs.org/)
