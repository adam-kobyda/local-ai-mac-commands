# last-downloaded

Prints the absolute path of the most recently downloaded file in `~/Downloads`.

Designed for local AI agents that need to reference a file the user just downloaded without being told its name.

## Install

Run `install.sh` from the repo root — it installs all commands including this one:

```bash
bash install.sh
```

## Usage

```bash
last-downloaded
# → /Users/you/Downloads/report.pdf
```

Returns the full path of the newest file in `~/Downloads` and exits 0.  
Exits 1 with an error message on stderr if the directory is empty.

## Usage for AI agents

When a user says something like "use the file I just downloaded", run:

```bash
last-downloaded
```

Capture stdout as the file path and proceed with that path. Do not ask the user to specify the filename — this command resolves it automatically.

Example agent pattern:

```
tool_call: bash("last-downloaded")
→ /Users/adam/Downloads/data.csv

# now use /Users/adam/Downloads/data.csv in the next step
```
