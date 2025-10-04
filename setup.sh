#!/bin/bash

set -e  # Exit on any error

echo "Installing droid..."
curl -fsSL https://app.factory.ai/cli | sh

echo "Installing Playwright test package..."
npm install -g @playwright/test

echo "Installing Playwright dependencies..."
npx playwright install-deps

echo "Installing Playwright browsers..."
npx playwright install

echo "Installing Playwright MCP..."
timeout 5 npx -y @playwright/mcp@latest
