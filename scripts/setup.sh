#!/bin/bash

# Setup script for Job Application Agent on GitHub Actions
# This script initializes the repository and configures GitHub secrets

set -e

echo "========================================="
echo "Job Application Agent - Setup Script"
echo "========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo -e "${RED}Error: Not in a git repository${NC}"
    echo "Please run: git clone https://github.com/aakashuvce1001/job-application-agent.git"
    exit 1
fi

echo -e "${YELLOW}Step 1: Checking for .env file...${NC}"
if [ ! -f .env ]; then
    echo "Creating .env from .env.example..."
    cp .env.example .env
    echo -e "${GREEN}✓ .env file created${NC}"
else
    echo -e "${GREEN}✓ .env file already exists${NC}"
fi

echo ""
echo -e "${YELLOW}Step 2: Installing Python dependencies...${NC}"
python -m pip install --upgrade pip
pip install -r requirements.txt
echo -e "${GREEN}✓ Dependencies installed${NC}"

echo ""
echo -e "${YELLOW}Step 3: Creating data directories...${NC}"
mkdir -p data logs
echo -e "${GREEN}✓ Directories created${NC}"

echo ""
echo -e "${YELLOW}Step 4: GitHub Secrets Configuration${NC}"
echo ""
echo "You need to set the following secrets in GitHub:"
echo "Repository → Settings → Secrets and variables → Actions"
echo ""
echo -e "${YELLOW}Required Secrets:${NC}"
echo "  1. OPENAI_API_KEY         - Get from https://platform.openai.com/api-keys"
echo "  2. INDEED_API_KEY         - Get from https://opensource.indeedeng.io/api/"
echo "  3. LINKEDIN_API_KEY       - Get from https://www.linkedin.com/developers"
echo "  4. RESUME_BASE64          - Base64 encoded resume (see instructions below)"
echo "  5. EMAIL_ADDRESS          - Your Gmail address"
echo "  6. EMAIL_PASSWORD         - Gmail App Password (NOT regular password)"
echo "  7. NOTIFICATION_EMAIL     - Email to receive notifications"
echo "  8. FIREBASE_CONFIG        - Firebase connection string (for database)"
echo ""

echo -e "${YELLOW}Step 5: How to encode your resume as base64${NC}"
echo ""
echo "Run this command to convert your resume:"
echo "  base64 -i data/resume.pdf | tr -d '\\n' | xclip -selection clipboard"
echo ""
echo "Or on macOS:"
echo "  base64 -i data/resume.pdf | tr -d '\\n' | pbcopy"
echo ""
echo "Then paste the output as RESUME_BASE64 secret in GitHub"
echo ""

echo -e "${YELLOW}Step 6: Testing locally (optional)${NC}"
echo ""
echo "To test the agent locally before pushing:"
echo "  1. Set your .env file with credentials"
echo "  2. Run: python -m agents.job_search_agent"
echo ""

echo ""
echo -e "${GREEN}========================================="
echo "Setup complete!"
echo "=========================================${NC}"
echo ""
echo "Next steps:"
echo "  1. Add your API credentials to .env"
echo "  2. Encode your resume as base64"
echo "  3. Add GitHub secrets (Repository Settings)"
echo "  4. Commit and push: git push origin main"
echo "  5. Check Actions tab to verify workflow runs"
echo ""
