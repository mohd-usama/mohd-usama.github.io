#!/bin/bash

# Exit on error
set -e

REPO_URL="${1:-https://github.com/mohd-usama/mohd-usama.github.io.git}"
TARGET_BRANCH="${2:-main}"

echo "🚀 Starting Flutter Web Deployment for: $REPO_URL"
echo "📌 Target branch: $TARGET_BRANCH"

# For username.github.io repos, base-href is always "/"
BASE_HREF="/"

echo "🌐 Base Href: $BASE_HREF"

# Step 1: Clean and build Flutter Web
echo "🔨 Building Flutter Web (Release)..."
flutter build web --release --base-href "$BASE_HREF"

# Step 2: Deploy build/web
echo "📤 Deploying build/web to branch '$TARGET_BRANCH'..."
cd build/web

# Initialize fresh git in build/web directory
rm -rf .git
git init
git checkout -b "$TARGET_BRANCH"
git add .
git commit -m "Deploy updated portfolio - $(date '+%Y-%m-%d %H:%M:%S')"
git remote add origin "$REPO_URL"

echo "🚀 Pushing to GitHub ($TARGET_BRANCH)..."
git push -f origin "$TARGET_BRANCH"

echo ""
echo "🎉 Deployment successful!"
echo "👉 Your portfolio is live at: https://mohd-usama.github.io/"
echo "⏳ Please wait 1-2 minutes for GitHub Pages to refresh the CDN."
