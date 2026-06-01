# CLAUDE.md

## Project Overview

**curly-couscous** is a bug bounty project targeting Microsoft Dynamics 365 Business Central, written in AL (Application Language). The repository is a scaffold for developing Business Central extensions and investigating security vulnerabilities.

- License: MIT
- Owner: liboriopilato-cmyk

## Repository Structure

```
curly-couscous/
├── CLAUDE.md          # This file
├── README.md          # Project description
├── LICENSE            # MIT license
└── .gitignore         # AL-specific ignores
```

No AL source files exist yet. When added, the typical structure for a BC extension is:

```
src/
├── *.Table.al         # Table definitions
├── *.Page.al          # Page definitions
├── *.Codeunit.al      # Business logic
├── *.Report.al        # Reports
├── *.Enum.al          # Enumerations
├── *.Query.al         # Queries
└── *.PermissionSet.al # Permission sets
app.json               # Extension manifest (ID, version, dependencies)
```

## Technology Stack

- **Language**: AL (Application Language) — the C/AL successor for Business Central extensions
- **Platform**: Microsoft Dynamics 365 Business Central
- **Toolchain**: AL Language extension for VS Code (`ms-dynamics-smb.al`)
- **Package manager**: BC symbol packages (`.app` files) downloaded via VS Code

## Development Workflow

### Prerequisites

1. Install [VS Code](https://code.visualstudio.com/) with the AL Language extension
2. Access to a Business Central sandbox environment (online or on-premises)
3. Configure `.vscode/launch.json` (git-ignored) to point at your BC instance

### Build & Deploy

```bash
# From VS Code — Ctrl+Shift+B or F5 to publish to sandbox
# AL compiler: alc.exe (bundled with the AL extension)
```

Compiled output is a `.app` file (git-ignored). Deploy it to BC via VS Code publish or upload through the BC Extension Management page.

### Ignored Artifacts

The `.gitignore` covers all generated/local artefacts:

| Path | Purpose |
|---|---|
| `.vscode/` | Local VS Code launch config (contains sandbox credentials) |
| `.alcache/` | Compiler cache |
| `.alpackages/` | Downloaded dependency symbols |
| `.snapshots/` | BC snapshot baselines |
| `.output/` | Build output |
| `*.app` | Compiled extension packages |
| `rad.json` | Rapid Application Development config |
| `*.g.xlf` | Auto-generated translation base files |
| `*.bclicense`, `*.flf` | License files |
| `TestResults.xml` | Test runner output |

## AL Conventions

- **Object numbering**: Extensions must use a registered object ID range. Do not use IDs outside the allocated range.
- **Naming**: PascalCase for objects, fields, and procedures. Use descriptive names — no abbreviations.
- **Events**: Prefer event subscribers over direct modifications to base objects.
- **Permissions**: Every object that accesses data needs appropriate `PermissionSet` coverage.
- **Test codeunits**: Use subtype `Test` with `[Test]` procedure attributes; isolate with `[TransactionModel(TransactionModel::AutoRollback)]`.

## Security / Bug Bounty Context

This project exists to investigate security issues in Business Central. When working on findings:

- Document reproduction steps clearly in code comments or dedicated files
- Never commit real credentials, license keys, or sensitive environment data
- Keep proof-of-concept code scoped — avoid broad destructive operations
- Follow responsible disclosure; do not push exploits to public branches before disclosure

## Git Workflow

- Default branch: `main`
- Feature/task branches follow the pattern `claude/<description>` for AI-assisted work
- Commit messages should be concise and describe the *why*, not just the *what*
- Push with `git push -u origin <branch-name>`
