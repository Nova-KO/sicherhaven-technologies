# 🚀 Deployment Guide - Sicherhaven Technologies Website

## ✅ Git Repository Ready
Your code is committed and ready to push to GitHub!

## Step 1: Create GitHub Repository

### Option A: Using GitHub CLI (gh)
```bash
cd /Users/anjali/Downloads/consalti-package/consalti

# Login to GitHub (if not already logged in)
gh auth login

# Create a new repository
gh repo create sicherhaven-technologies --public --source=. --remote=origin --push

# Done! Your code is now on GitHub
```

### Option B: Using GitHub Website
1. Go to https://github.com/new
2. Repository name: `sicherhaven-technologies`
3. Description: `Sicherhaven Technologies - IT Consulting & Cybersecurity Services Website`
4. Choose Public or Private
5. **DO NOT** initialize with README (we already have one)
6. Click "Create repository"

Then run these commands:
```bash
cd /Users/anjali/Downloads/consalti-package/consalti

# Add your GitHub repository as remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/sicherhaven-technologies.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 2: Deploy to Vercel

### Option A: Using Vercel CLI (Recommended)
```bash
cd /Users/anjali/Downloads/consalti-package/consalti

# Install Vercel CLI (if not installed)
npm install -g vercel

# Login to Vercel
vercel login

# Deploy to Vercel
vercel

# Follow the prompts:
# - Set up and deploy? Yes
# - Which scope? (select your account)
# - Link to existing project? No
# - Project name? sicherhaven-technologies
# - Directory? ./
# - Override settings? No

# Deploy to production
vercel --prod
```

### Option B: Using Vercel Website
1. Go to https://vercel.com/new
2. Click "Import Git Repository"
3. Select your GitHub repository: `sicherhaven-technologies`
4. Configure:
   - Framework Preset: Other
   - Root Directory: ./
   - Build Command: (leave empty)
   - Output Directory: (leave empty)
5. Click "Deploy"

## Step 3: Custom Domain (Optional)

### On Vercel Dashboard:
1. Go to your project settings
2. Click "Domains"
3. Add your custom domain (e.g., sicherhaven.com)
4. Follow DNS configuration instructions

## 🎉 Your Website Will Be Live At:
- Vercel URL: `https://sicherhaven-technologies.vercel.app`
- Or your custom domain

## Files Included:
- ✅ `vercel.json` - Vercel configuration
- ✅ `.gitignore` - Git ignore rules
- ✅ `README.md` - Project documentation
- ✅ All website files with Sicherhaven branding

## Quick Deploy Commands:
```bash
# If you have gh and vercel CLI installed:
cd /Users/anjali/Downloads/consalti-package/consalti

# Create GitHub repo and push
gh repo create sicherhaven-technologies --public --source=. --remote=origin --push

# Deploy to Vercel
vercel --prod
```

## Environment Variables (if needed):
If you need to add environment variables:
1. Go to Vercel Dashboard → Your Project → Settings → Environment Variables
2. Add any required variables

## Continuous Deployment:
Once connected to GitHub, every push to main branch will automatically deploy to Vercel!

```bash
# Make changes
git add .
git commit -m "Update content"
git push origin main

# Vercel will automatically deploy!
```

## Support:
- GitHub: https://docs.github.com
- Vercel: https://vercel.com/docs

