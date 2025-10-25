#!/bin/bash

# Sicherhaven Technologies - Automated Deployment Script
# This script will push to GitHub and deploy to Vercel

echo "🚀 Sicherhaven Technologies - Deployment Script"
echo "================================================"
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Error: Git repository not initialized"
    exit 1
fi

echo "📋 Step 1: Checking GitHub CLI authentication..."
if ! gh auth status &>/dev/null; then
    echo "⚠️  Not logged in to GitHub. Please login:"
    gh auth login
fi

echo ""
echo "📋 Step 2: Creating GitHub repository..."
read -p "Enter repository name (default: sicherhaven-technologies): " REPO_NAME
REPO_NAME=${REPO_NAME:-sicherhaven-technologies}

read -p "Make repository public? (y/n, default: y): " IS_PUBLIC
IS_PUBLIC=${IS_PUBLIC:-y}

if [ "$IS_PUBLIC" = "y" ]; then
    VISIBILITY="--public"
else
    VISIBILITY="--private"
fi

echo ""
echo "Creating repository: $REPO_NAME"
gh repo create "$REPO_NAME" $VISIBILITY --source=. --remote=origin --push

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    REPO_URL=$(gh repo view --json url -q .url)
    echo "📍 Repository URL: $REPO_URL"
else
    echo "⚠️  Repository might already exist or there was an error"
    echo "Attempting to push to existing remote..."
    git push -u origin main
fi

echo ""
echo "📋 Step 3: Deploying to Vercel..."
echo "⚠️  You may need to login to Vercel if not already authenticated"
echo ""

# Deploy to Vercel
vercel --prod --yes

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Deployment Complete!"
    echo "================================================"
    echo ""
    echo "✅ GitHub Repository: $REPO_URL"
    echo "✅ Vercel: Check the URL above"
    echo ""
    echo "Your Sicherhaven Technologies website is now live!"
else
    echo ""
    echo "⚠️  Vercel deployment encountered an issue"
    echo "You can manually deploy by running: vercel --prod"
fi

echo ""
echo "📝 Next steps:"
echo "  1. Visit your Vercel dashboard: https://vercel.com/dashboard"
echo "  2. Configure custom domain if needed"
echo "  3. Set up environment variables if required"
echo ""

