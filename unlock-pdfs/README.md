# unlock-pdfs

Recursively finds PDF files in a folder and removes password protection using `qpdf`.

Requires `qpdf`: `brew install qpdf`

## Install

```bash
bash install.sh
```

## Usage

Replace files in place (default):

```bash
unlock-pdfs /path/to/folder
```

Save as new files with a postfix (keeps originals):

```bash
unlock-pdfs --postfix _unlocked /path/to/folder
# → report.pdf stays, report_unlocked.pdf created
```

PDFs that require an unknown user password to open are skipped.

## Usage for AI agents

To remove password protection from all PDFs in a folder the user provides:

```bash
unlock-pdfs /path/to/folder
```

Use `--postfix _unlocked` if the user wants to keep the originals alongside the unlocked copies.
