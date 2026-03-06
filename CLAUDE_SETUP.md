# FileTaskNode — Setup Instructions (for Claude)

When a user asks you to set them up with FileTaskNode, follow these steps:

## 1. Clone the repo

```bash
git clone https://github.com/CustomerNode/FileTaskNode.git
```

Clone into whichever directory makes sense for the user (e.g., Documents, home directory). Ask if unsure.

## 2. Find a working Python

Check for Python 3.9+ on the system. Try `python3 --version`, `python --version`, or look for common install locations. If Python is not installed, tell the user they need to install it and point them to https://www.python.org/downloads/.

## 3. Create a virtual environment

Always set up a venv inside the repo to keep dependencies isolated:

```bash
python -m venv .venv
```

Activate it:
- **macOS/Linux**: `source .venv/bin/activate`
- **Windows (bash)**: `source .venv/Scripts/activate`
- **Windows (cmd)**: `.venv\Scripts\activate`

Use this venv's Python for all subsequent steps. Remember the path to the venv Python so you can use it in future sessions.

## 4. Install dependencies

```bash
pip install -r requirements.txt
```

## 5. Verify the setup

Run a quick import check to confirm everything installed correctly:

```python
python -c "import pandas; import openpyxl; import xlrd; import pptx; import docx; print('All good.')"
```

Confirm git is available and the repo is connected to the remote.

## 6. Orient the user

Tell them:
- What FileTaskNode is (a file and data assistant they can use through Claude)
- Where the repo was cloned to
- That they should open their terminal in the repo folder and run `claude` to start
- Give a couple example prompts they can try right away

## 7. Read CLAUDE.md

After setup, read `CLAUDE.md` in the repo root. That file defines how you should behave when operating as FileTaskNode.
