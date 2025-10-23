# Pre-commit Hooks Setup Guide

This template includes comprehensive pre-commit hooks for code quality and security.

## Automatic Setup

The `setup_project.sh` script automatically installs and configures pre-commit hooks.

## Manual Setup

If you need to set up pre-commit hooks manually:

```bash
# Install pre-commit
pip install pre-commit

# Install hooks
pre-commit install

# Fix any config issues
pre-commit migrate-config

# Test hooks on all files
pre-commit run --all-files
```

## What the Hooks Do

### Code Quality
- **trailing-whitespace** - Removes trailing whitespace
- **end-of-file-fixer** - Ensures files end with newline
- **black** - Auto-formats Python code
- **isort** - Sorts imports automatically
- **flake8** - Linting and style checks
- **mypy** - Type checking

### Security
- **bandit** - Security vulnerability scanning
- **trufflehog** - Secret detection

### File Validation
- **check-yaml** - YAML syntax validation
- **check-json** - JSON syntax validation
- **check-added-large-files** - Prevents large files
- **check-merge-conflict** - Detects merge conflicts
- **debug-statements** - Finds debug statements

## Workflow

1. **Write code**
2. **git add .**
3. **git commit** ← All hooks run automatically
4. **Fix any issues** if hooks fail
5. **git commit** again
6. **git push**

## Skipping Hooks

To skip hooks temporarily (not recommended):

```bash
# Skip all hooks
git commit --no-verify -m "message"

# Skip specific hook
SKIP=bandit git commit -m "message"
```

## Troubleshooting

### Hook Installation Issues
```bash
# Reinstall hooks
pre-commit uninstall
pre-commit install
```

### Dependency Issues
```bash
# Clean and reinstall
pre-commit clean
pre-commit install --install-hooks
```

### Bandit pbr Dependency Issue
If you see `ModuleNotFoundError: No module named 'pbr'` with bandit:
- This is fixed in the template with `additional_dependencies: ['pbr']`
- If you encounter it, clean and reinstall hooks as above

### Config Updates
```bash
# Update hook versions
pre-commit autoupdate
```

The hooks ensure code quality and security before any code reaches your repository!