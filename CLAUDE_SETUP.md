# FileTaskNode — Setup Instructions (for Claude)

When a user asks you to set them up with FileTaskNode, follow these steps:

## 1. Detect the OS and pick an install location

Figure out what platform you're on (Windows, macOS, Linux) and choose a sensible location for the repo:

- **Windows**: `%USERPROFILE%\Documents\FileTaskNode`
- **macOS**: `~/Documents/FileTaskNode`
- **Linux**: `~/FileTaskNode`

Don't ask the user to pick — just use the default. If it already exists, ask before overwriting.

## 2. Fork and clone the repo

Check if `gh` (GitHub CLI) is available. If so, fork the repo to the user's GitHub account and clone the fork:

```bash
gh repo fork CustomerNode/FileTaskNode --clone=true
```

If `gh` is not available, just clone the repo directly:

```bash
git clone https://github.com/CustomerNode/FileTaskNode.git
```

The fork gives the user their own copy they can freely modify and commit to. If they cloned without forking, that's fine — they can still work locally.

## 3. Find a working Python

Check for Python 3.9+ on the system. Try `python3 --version`, `python --version`, or look for common install locations. If Python is not installed, tell the user they need to install it and point them to https://www.python.org/downloads/.

## 4. Create a virtual environment

Set up a venv inside the repo:

```bash
python -m venv .venv
```

Activate it:
- **macOS/Linux**: `source .venv/bin/activate`
- **Windows (bash)**: `source .venv/Scripts/activate`
- **Windows (cmd)**: `.venv\Scripts\activate`

Use this venv's Python for all subsequent steps. Remember the path to the venv Python so you can use it in future sessions.

## 5. Install dependencies

```bash
pip install -r requirements.txt
```

## 6. Verify the setup

Run a quick import check:

```bash
python -c "import pandas; import openpyxl; import xlrd; import pptx; import docx; print('All good.')"
```

## 7. Create a homescreen/desktop shortcut

The goal: the user double-clicks an icon and lands directly in FileTaskNode with Claude running.

### Windows

The repo includes `launch.bat`. Create a desktop shortcut pointing to it:

```powershell
powershell -Command "$repo = '<REPO_PATH>'; $ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(\"$env:USERPROFILE\Desktop\FileTaskNode.lnk\"); $s.TargetPath = \"$repo\launch.bat\"; $s.WorkingDirectory = \"$repo\"; $s.IconLocation = \"$repo\assets\filetasknode.ico\"; $s.Save()"
```

Replace `<REPO_PATH>` with the actual path where the repo was cloned.

### macOS

Create an Automator app or a simple `.command` file on the Desktop:

```bash
cat > ~/Desktop/FileTaskNode.command << 'EOF'
#!/bin/bash
cd ~/Documents/FileTaskNode
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
EOF
chmod +x ~/Desktop/FileTaskNode.command
```

### Linux

Create a `.desktop` file:

```bash
cat > ~/Desktop/FileTaskNode.desktop << EOF
[Desktop Entry]
Name=FileTaskNode
Exec=bash -c 'cd ~/FileTaskNode && bash launch.sh'
Icon=~/FileTaskNode/assets/filetasknode.ico
Terminal=true
Type=Application
EOF
chmod +x ~/Desktop/FileTaskNode.desktop
```

## 8. Orient the user

Tell them:
- FileTaskNode is ready — they can double-click the shortcut on their desktop to start
- They just type what they need in plain English
- Give them a couple example prompts to try right away:
  - "Analyze the spreadsheet on my desktop"
  - "Make me a PowerPoint about X"
  - "Organize my Downloads folder"

## 9. Read CLAUDE.md

After setup, read `CLAUDE.md` in the repo root. That file defines how you should behave when operating as FileTaskNode.
