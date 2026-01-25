#!/bin/bash
set -e

echo "=== WriteForge Development Setup ==="
echo ""

# Check prerequisites
echo "Checking prerequisites..."

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed. Please install Node.js 20+."
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo "ERROR: Node.js 20+ required. Found: $(node -v)"
    exit 1
fi
echo "  Node.js: $(node -v)"

# Check pnpm
if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    npm install -g pnpm
fi
echo "  pnpm: $(pnpm -v)"

# Check Docker (optional)
if command -v docker &> /dev/null; then
    echo "  Docker: $(docker -v | cut -d' ' -f3 | tr -d ',')"
else
    echo "  Docker: Not installed (optional, needed for LanguageTool server)"
fi

echo ""
echo "Installing dependencies..."
pnpm install

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "  1. Start LanguageTool server: pnpm languagetool:start"
echo "  2. Start extension development: pnpm extension:dev"
echo ""
echo "For macOS desktop development:"
echo "  - Open packages/desktop-mac/WriteForge.xcodeproj in Xcode"
echo ""
