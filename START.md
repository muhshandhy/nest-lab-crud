# 📌 MULAI DARI SINI

Selamat datang! Proyek **Median Blog API** sudah siap untuk dijalankan.

---

## 🎯 3 Pilihan untuk Memulai

### 1️⃣ **Cara Termudah** (Automatic Setup)

Jalankan script auto-setup:

**Linux/MacOS:**
```bash
bash start.sh
```

**Windows PowerShell:**
```powershell
# Navigate to median folder
cd median
npm install
docker compose up -d
npx prisma migrate deploy
npm run prisma:seed
npm run start:dev
```

---

### 2️⃣ **Panduan Step-by-Step**

Buka file: **[QUICK_START.md](./QUICK_START.md)**

Berisi instruksi detail untuk setiap langkah setup.

---

### 3️⃣ **Setup Lanjutan**

Buka file: **[SETUP_GUIDE.md](./SETUP_GUIDE.md)**

Berisi troubleshooting, tips development, dan reference lengkap.

---

## 📂 File-File Penting

| File | Deskripsi |
|------|-----------|
| `QUICK_START.md` | 👈 **Mulai dari sini!** Guide step-by-step |
| `SETUP_GUIDE.md` | Troubleshooting & advanced setup |
| `start.sh` | Script auto-setup (Linux/MacOS) |
| `median/` | Folder project utama |
| `median/IMPLEMENTATION.md` | Dokumentasi fitur teknis |
| `chapter-1/` hingga `chapter-4/` | Tutorial lengkap |

---

## ✨ Setelah Setup Selesai

### 🌐 Akses Aplikasi

- **API**: http://localhost:3000
- **Swagger UI**: http://localhost:3000/api ← **Buka ini untuk test**
- **Database GUI**: `npx prisma studio`

### 🔐 Test Login

```json
{
  "email": "sabin@adams.com",
  "password": "password-sabin"
}
```

### 🚀 Next Steps

1. Buka Swagger UI: http://localhost:3000/api
2. Test endpoint `/auth/login` untuk mendapat JWT token
3. Klik "Authorize" dan paste token
4. Test semua endpoint!

---

## 🛑 Jika Ada Error

**Lihat Troubleshooting di [SETUP_GUIDE.md](./SETUP_GUIDE.md)**

Bagian "🐛 Troubleshooting" mencakup solusi untuk:
- Port 3000 already in use
- PostgreSQL connection error
- Migration failed
- Module not found errors
- Dan lainnya

---

## 📖 Ingin Belajar?

Tutorial lengkap tersedia di:
- `chapter-1/README.md` - REST API Basics
- `chapter-2/README.md` - Validation & Error Handling
- `chapter-3/README.md` - Database Relations & Users
- `chapter-4/README.md` - Authentication with JWT

---

## ⚡ Quick Commands

```bash
cd median

# Start development
npm run start:dev

# View database
npx prisma studio

# Run migrations
npx prisma migrate dev

# Seed database
npm run prisma:seed

# Docker commands
docker compose up -d      # Start PostgreSQL
docker compose down       # Stop PostgreSQL
docker compose ps         # Check status
```

---

## ✅ Checklist Setup

Setelah menjalankan, pastikan ini terselesaikan:

- [ ] Node.js & npm terinstall
- [ ] Docker & docker-compose terinstall
- [ ] Dependencies di-install (`npm install`)
- [ ] PostgreSQL berjalan (`docker compose ps menunjukkan postgres Up`)
- [ ] Migrations applied (`npx prisma migrate deploy`)
- [ ] Database di-seed (`npm run prisma:seed`)
- [ ] Server berjalan (`npm run start:dev`)
- [ ] Dapat akses http://localhost:3000/api
- [ ] Login berhasil dengan `sabin@adams.com` / `password-sabin`

---

## 💡 Tips

1. **Jaga terminal tetap terbuka** saat development. Itu tempat server berjalan.

2. **Untuk stop server**: Tekan `Ctrl+C` di terminal.

3. **Untuk development**, gunakan **Swagger UI** (http://localhost:3000/api) untuk test API.

4. **Jika code diubah**, server otomatis restart (hot reload).

---

**🎉 Siap memulai? Jalankan command di atas atau buka QUICK_START.md!**

Butuh bantuan? → Lihat **SETUP_GUIDE.md**
