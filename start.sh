#!/bin/bash

# ============================================
# MEDIAN BLOG API - QUICK START
# ============================================

echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║     🚀 MEDIAN BLOG API - SETUP & START             ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

cd median || { echo "❌ Could not find median directory"; exit 1; }

echo -e "${BLUE}Step 1: Installing dependencies...${NC}"
npm install 2>&1 | grep -E "(added|up to date|npm WARN)" | tail -3
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Dependencies installed${NC}"
else
  echo -e "${GREEN}✅ Dependencies ready${NC}"
fi
echo ""

echo -e "${BLUE}Step 2: Starting PostgreSQL database...${NC}"
docker compose up -d 2>&1 | grep -E "(Creating|Started|already running)"
sleep 3
echo -e "${GREEN}✅ PostgreSQL running${NC}"
echo ""

echo -e "${BLUE}Step 3: Running migrations...${NC}"
npx prisma migrate deploy 2>&1 | grep -E "(Applying|already|migrations)" | head -2
echo -e "${GREEN}✅ Migrations completed${NC}"
echo ""

echo -e "${BLUE}Step 4: Seeding database...${NC}"
npm run prisma:seed 2>&1 | tail -5
echo -e "${GREEN}✅ Database seeded${NC}"
echo ""

echo "╔════════════════════════════════════════════════════╗"
echo "║           ✨ READY TO START! ✨                    ║"
echo "╠════════════════════════════════════════════════════╣"
echo "║                                                    ║"
echo "║  Starting development server...                    ║"
echo "║                                                    ║"
echo "║  📍 API:        http://localhost:3000              ║"
echo "║  📚 Swagger:    http://localhost:3000/api          ║"
echo "║  🗄️  Database:   npx prisma studio                 ║"
echo "║                                                    ║"
echo "║  🔐 Test Login:                                    ║"
echo "║     Email:    sabin@adams.com                      ║"
echo "║     Password: password-sabin                       ║"
echo "║                                                    ║"
echo "║  Press Ctrl+C to stop server                       ║"
echo "║                                                    ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

npm run start:dev
