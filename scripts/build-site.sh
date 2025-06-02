#!/bin/bash
set -e

echo "🚀 Building nsyte website..."

# Create dist directory
mkdir -p dist

# Copy splash page to root
echo "📄 Copying splash page..."
cp index.html dist/

# Copy install script to a subdirectory to avoid root-level restrictions
echo "📦 Preparing install script..."
mkdir -p dist/get
cp install.sh dist/get/install.sh
cp install.sh dist/get/install.txt
# Also keep copies at root for backward compatibility
cp install.sh dist/install.sh
cp install.sh dist/install.txt

# Build documentation with MkDocs
echo "📚 Building documentation..."
.venv/docs/bin/mkdocs build

echo "✅ Website built successfully!"
echo ""
echo "Structure:"
echo "  dist/"
echo "  ├── index.html          (splash page)"
echo "  ├── install.sh           (install script)"
echo "  └── docs/               (documentation)"
echo ""
echo "🌐 Open dist/index.html to view the site"