# FileTaskNode

CLI automation toolkit for file and data tasks, powered by [Claude Code](https://claude.com/claude-code).

Built by [CustomerNode](https://github.com/CustomerNode).

## What is this?

FileTaskNode is a collection of Python scripts you can run directly or through Claude Code to automate common file and data tasks — no coding required. Just describe what you need and Claude handles the rest.

## Scripts

| Script | Description |
|--------|-------------|
| `excel_pivot.py` | Generate pivot tables from Excel files |

*More coming soon.*

## Requirements

- Python 3.9+
- `pandas`
- `openpyxl`
- `xlrd` (for `.xls` files)

## Quick Start

1. Clone the repo:
   ```bash
   git clone https://github.com/CustomerNode/FileTaskNode.git
   cd FileTaskNode
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run a script directly:
   ```bash
   python scripts/excel_pivot.py path/to/your/file.xlsx
   ```

4. Or just use Claude Code in this repo and ask:
   > "Make a pivot table from my sales spreadsheet grouped by region"

## License

MIT
