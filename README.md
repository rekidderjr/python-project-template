# Python Project Template

[![Security Scan](https://github.com/rekidderjr/python-project-template/workflows/Security%20Scan/badge.svg)](https://github.com/rekidderjr/python-project-template/actions)
[![Code Quality](https://github.com/rekidderjr/python-project-template/workflows/Code%20Quality/badge.svg)](https://github.com/rekidderjr/python-project-template/actions)
[![Tests](https://github.com/rekidderjr/python-project-template/workflows/Tests/badge.svg)](https://github.com/rekidderjr/python-project-template/actions)
[![Template](https://img.shields.io/badge/template-python-blue.svg)](https://github.com/rekidderjr/python-project-template/generate)

Enterprise-grade Python project template with comprehensive security scanning, code quality enforcement, and CI/CD workflows. Includes pre-commit hooks, automated compliance checking, and professional documentation standards.

## Quick Start

Click **"Use this template"** to create a new repository, then:

```bash
# Clone your new repository
git clone https://github.com/yourusername/your-project-name.git
cd your-project-name

# Run the setup script to customize the template
./setup_project.sh
```

## Features

- **Security First**: Comprehensive security scanning with Bandit, Safety, Semgrep, and TruffleHog
- **Quality Assured**: Automated code quality checks with Black, isort, flake8, pylint, mypy, and pydocstyle
- **CI/CD Ready**: GitHub Actions workflows for testing, security, and quality checks
- **Documentation**: Google-style docstring requirements and comprehensive standards
- **Pre-commit Hooks**: Automated quality checks before every commit
- **Testing**: pytest with coverage reporting and multi-Python version support
- **Enterprise Ready**: Meets customer compliance requirements with automated checking

## What's Included

### Security & Compliance
- **Bandit**: Python security linter
- **Safety**: Dependency vulnerability scanner
- **Semgrep**: Static analysis security scanner
- **TruffleHog**: Secret detection
- **pip-audit**: Dependency vulnerability auditing
- **Automated compliance checking script**

### Code Quality
- **Black**: Code formatting
- **isort**: Import sorting
- **flake8**: Style guide enforcement
- **pylint**: Code analysis
- **mypy**: Type checking
- **pydocstyle**: Docstring conventions (Google style)

### Testing & Coverage
- **pytest**: Testing framework
- **pytest-cov**: Coverage reporting
- **pytest-mock**: Mocking utilities
- **Multi-Python version testing** (3.10, 3.11, 3.12)

### CI/CD Workflows
- **Security scanning**: Automated security checks
- **Code quality**: Style and quality enforcement
- **Testing**: Comprehensive test execution
- **Coverage reporting**: Codecov integration

## Requirements

- Python 3.8 or higher
- Git
- Pre-commit (installed automatically)

## Usage

### 1. Create from Template
Click **"Use this template"** on GitHub to create your new repository.

### 2. Customize Your Project

**Unix/Linux/macOS:**
```bash
# Clone and setup
git clone https://github.com/yourusername/your-new-project.git
cd your-new-project

# Run setup script (customizes all placeholders)
./setup_project.sh
```

**Windows (PowerShell):**
```powershell
# Clone and setup
git clone https://github.com/yourusername/your-new-project.git
cd your-new-project

# Run setup script (customizes all placeholders)
.\setup_project.ps1
```

### 3. Start Developing

**Unix/Linux/macOS:**
```bash
# Activate virtual environment (created by setup script)
source venv/bin/activate

# Start coding in src/your_package/
# Write tests in tests/
# Run quality checks
./customer-compliance-check.sh
```

**Windows (PowerShell):**
```powershell
# Activate virtual environment (created by setup script)
venv\Scripts\Activate.ps1

# Start coding in src\your_package\
# Write tests in tests\
# Run quality checks
.\customer-compliance-check.sh
```

## Project Structure

```
your-project/
├── .github/workflows/          # CI/CD workflows
│   ├── security.yml           # Security scanning
│   ├── code-quality.yml       # Code quality checks
│   └── tests.yml              # Test execution
├── src/your_package/          # Source code
│   ├── __init__.py
│   └── main.py
├── tests/                     # Test files
├── docs/                      # Documentation
├── requirements.txt           # Production dependencies
├── requirements-dev.txt       # Development dependencies
├── setup.cfg                  # Tool configuration
├── pyproject.toml            # Project metadata
├── .pre-commit-config.yaml   # Pre-commit hooks
├── .gitignore                # Git ignore rules
├── CODE_QUALITY_STANDARDS.md # Quality standards
├── customer-compliance-check.sh # Compliance script
├── setup_project.sh          # Template customization (Unix/Linux/macOS)
├── setup_project.ps1         # Template customization (Windows)
```

## Security Features

- **Secret Detection**: TruffleHog prevents credential leaks
- **Vulnerability Scanning**: Safety and pip-audit catch vulnerable dependencies
- **Static Analysis**: Semgrep finds security vulnerabilities
- **Security Linting**: Bandit identifies common security issues
- **Automated Reporting**: All security findings saved as CI artifacts

## Quality Standards

- **Code Coverage**: Minimum 80% required
- **Type Hints**: Required for all public functions
- **Docstrings**: Google-style docstrings for all modules, classes, and functions
- **Security**: Zero high-severity security issues
- **Style**: PEP 8 compliance with Black formatting

## Development Workflow

1. **Make Changes**: Edit code in `src/` and tests in `tests/`
2. **Quality Checks**: Pre-commit hooks run automatically
3. **Manual Checks**: Run `./customer-compliance-check.sh`
4. **Commit**: All quality gates must pass
5. **Push**: CI/CD workflows validate everything again

## Contributing

This template welcomes contributions! Please:

1. Fork the template repository
2. Create a feature branch
3. Make your improvements
4. Ensure all quality checks pass
5. Submit a pull request

## License

This template is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/rekidderjr/python-project-template/issues)
- **Discussions**: [GitHub Discussions](https://github.com/rekidderjr/python-project-template/discussions)
- **Documentation**: See included markdown files

## Acknowledgments

Built with modern Python development best practices and enterprise security standards in mind.

---

**Ready to build secure, high-quality Python applications? Click "Use this template" to get started!**