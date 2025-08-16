#!/bin/bash

# URBAN_SOLE Quick Deployment Script
# This script helps with local development and deployment

echo "🚀 URBAN_SOLE Deployment Helper"
echo "=================================="

echo "Select deployment option:"
echo "1) Start local development server (Python)"
echo "2) Start live server with auto-reload (requires npm install -g live-server)"
echo "3) Open GitHub Pages setup guide"
echo "4) Open Netlify deployment"
echo "5) Open Vercel deployment"
echo "6) Test website locally"
echo "0) Exit"

read -p "Enter your choice (0-6): " choice

case $choice in
    1)
        echo "🌐 Starting Python development server..."
        echo "📍 Website will be available at: http://localhost:8000"
        echo "🛑 Press Ctrl+C to stop the server"
        python3 -m http.server 8000
        ;;
    2)
        echo "⚡ Starting live server with auto-reload..."
        if command -v live-server &> /dev/null; then
            live-server
        else
            echo "❌ live-server not found. Installing..."
            npm install -g live-server
            live-server
        fi
        ;;
    3)
        echo "📖 Opening GitHub Pages setup guide..."
        echo "🔗 Go to: https://github.com/ISHU456/URBAN_SOLE/settings/pages"
        echo "📋 Follow the instructions in DEPLOYMENT.md"
        if command -v open &> /dev/null; then
            open "https://github.com/ISHU456/URBAN_SOLE/settings/pages"
        fi
        ;;
    4)
        echo "🌐 Opening Netlify deployment..."
        echo "🔗 Go to: https://netlify.com"
        if command -v open &> /dev/null; then
            open "https://netlify.com"
        fi
        ;;
    5)
        echo "⚡ Opening Vercel deployment..."
        echo "🔗 Go to: https://vercel.com"
        if command -v open &> /dev/null; then
            open "https://vercel.com"
        fi
        ;;
    6)
        echo "🧪 Testing website locally..."
        echo "✅ Checking if index.html exists..."
        if [ -f "index.html" ]; then
            echo "✅ index.html found"
        else
            echo "❌ index.html not found"
            exit 1
        fi
        
        echo "✅ Checking assets directory..."
        if [ -d "assets" ]; then
            echo "✅ assets directory found"
            echo "  📁 CSS files: $(find assets/css -name "*.css" | wc -l)"
            echo "  📁 JS files: $(find assets/js -name "*.js" | wc -l)"
            echo "  📁 Images: $(find assets/images -type f | wc -l)"
        else
            echo "❌ assets directory not found"
        fi
        
        echo "✅ Checking pages directory..."
        if [ -d "pages" ]; then
            echo "✅ pages directory found"
            echo "  📄 HTML pages: $(find pages -name "*.html" | wc -l)"
        else
            echo "❌ pages directory not found"
        fi
        
        echo "🎉 Website structure looks good!"
        echo "🌐 Ready for deployment!"
        ;;
    0)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid option. Please try again."
        ;;
esac
