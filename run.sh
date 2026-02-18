#!/bin/bash

# Median Blog API - Setup and Run Script

set -e  # Exit if any command fails

echo "🚀 Starting Median Blog API Setup..."
echo ""

# Navigate to project directory
cd median

# 1. Install dependencies
echo "📦 Installing npm dependencies..."
npm install
echo "✅ Dependencies installed!"
echo ""

# 2. Start PostgreSQL with Docker
echo "🐘 Starting PostgreSQL database..."
docker compose up -d
echo "⏳ Waiting for PostgreSQL to be ready..."
sleep 5
echo "✅ PostgreSQL is running!"
echo ""

# 3. Run Prisma migrations
echo "🔄 Running Prisma migrations..."
npx prisma migrate deploy
echo "✅ Database migrations completed!"
echo ""

# 4. Seed database
echo "🌱 Seeding database with sample data..."
npm run prisma:seed
echo "✅ Database seeded!"
echo ""

# 5. Start development server
echo "🎯 Starting NestJS development server..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✨ API Running at: http://localhost:3000"
echo "📚 Swagger UI at: http://localhost:3000/api"
echo "🗄️  Database UI at: npx prisma studio"
echo ""
echo "🔐 Test Credentials:"
echo "   Email: sabin@adams.com"
echo "   Password: password-sabin"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

npm run start:dev
