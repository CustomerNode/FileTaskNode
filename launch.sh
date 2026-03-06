#!/bin/bash
cd "$(dirname "$0")"
echo ""
echo "  FileTaskNode"
echo "  By CustomerNode LLC (customernode.com)"
echo "  Powered by Claude Code"
echo "  ============"
echo ""
echo "  1. Start new session"
echo "  2. Resume previous session"
echo ""
read -p "  Choose (1 or 2): " choice
if [ "$choice" = "2" ]; then
    claude --resume
else
    claude
fi
