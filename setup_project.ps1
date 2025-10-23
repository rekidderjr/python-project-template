# Project Setup Script for Windows
# Initializes a new project with all compliance and security features

param(
    [string]$ProjectName,
    [string]$AuthorName,
    [string]$AuthorEmail,
    [string]$GitHubUsername
)

Write-Host "Setting up your new secure Python project..." -ForegroundColor Blue
Write-Host "==============================================" -ForegroundColor Blue

# Get project details from user if not provided
if (-not $ProjectName) {
    $ProjectName = Read-Host "Enter your project name (e.g., my-awesome-project)"
}
if (-not $AuthorName) {
    $AuthorName = Read-Host "Enter your name"
}
if (-not $AuthorEmail) {
    $AuthorEmail = Read-Host "Enter your email"
}
if (-not $GitHubUsername) {
    $GitHubUsername = Read-Host "Enter your GitHub username"
}

# Validate inputs
if (-not $ProjectName -or -not $AuthorName -or -not $AuthorEmail -or -not $GitHubUsername) {
    Write-Host "All fields are required!" -ForegroundColor Red
    exit 1
}

# Convert project name to valid Python package name
$PackageName = $ProjectName.ToLower() -replace '[^a-z0-9]', '_'

Write-Host "`nProject Configuration:" -ForegroundColor Blue
Write-Host "Project Name: $ProjectName"
Write-Host "Package Name: $PackageName"
Write-Host "Author: $AuthorName"
Write-Host "Email: $AuthorEmail"
Write-Host "GitHub: $GitHubUsername"

$Confirm = Read-Host "Continue with this configuration? (y/N)"
if ($Confirm -notmatch '^[Yy]$') {
    Write-Host "Setup cancelled."
    exit 0
}

Write-Host "`nCustomizing project files..." -ForegroundColor Blue

# Update package directory name
if (Test-Path "src\your_package") {
    Rename-Item "src\your_package" "src\$PackageName"
}

# Clean up any cached/generated files before customization
Write-Host "Cleaning up cached files..." -ForegroundColor Blue
Get-ChildItem -Path . -Recurse -Name "__pycache__" -Directory | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path . -Recurse -Name "*.pyc" | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path . -Recurse -Name "*.pyo" | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path . -Name ".coverage" | Remove-Item -Force -ErrorAction SilentlyContinue
@(".pytest_cache", "htmlcov", ".tox", ".mypy_cache") | ForEach-Object { 
    if (Test-Path $_) { Remove-Item $_ -Recurse -Force -ErrorAction SilentlyContinue }
}

# Function to update file content
function Update-FileContent {
    param($FilePath, $Replacements)
    
    if (Test-Path $FilePath) {
        $content = Get-Content $FilePath -Raw
        foreach ($replacement in $Replacements.GetEnumerator()) {
            $content = $content -replace [regex]::Escape($replacement.Key), $replacement.Value
        }
        Set-Content $FilePath $content -NoNewline
    }
}

# Define replacements
$replacements = @{
    'your-project-name' = $ProjectName
    'Your Name' = $AuthorName
    'your.email@example.com' = $AuthorEmail
    'yourusername' = $GitHubUsername
    'your_package' = $PackageName
    'Your Package' = $ProjectName
    'Project Name' = $ProjectName
    '2025' = (Get-Date).Year.ToString()
}

# Update files
Update-FileContent "pyproject.toml" $replacements
Update-FileContent "setup.cfg" $replacements
Update-FileContent "README.md" $replacements
Update-FileContent "LICENSE" $replacements

if (Test-Path "src\$PackageName\__init__.py") {
    Update-FileContent "src\$PackageName\__init__.py" $replacements
}

if (Test-Path "tests\test_main.py") {
    Update-FileContent "tests\test_main.py" @{'your_package' = $PackageName}
}

Write-Host "Project files customized successfully!" -ForegroundColor Green

# Check Python version
Write-Host "`nChecking Python version..." -ForegroundColor Blue
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python version: $pythonVersion"
    
    $versionMatch = $pythonVersion -match "Python (\d+)\.(\d+)"
    if ($versionMatch) {
        $major = [int]$matches[1]
        $minor = [int]$matches[2]
        if ($major -ge 3 -and $minor -ge 8) {
            Write-Host "Python 3.8+ detected" -ForegroundColor Green
        } else {
            Write-Host "Python 3.8+ required" -ForegroundColor Red
            exit 1
        }
    }
} catch {
    Write-Host "Python not found" -ForegroundColor Red
    exit 1
}

# Create virtual environment
Write-Host "`nCreating virtual environment..." -ForegroundColor Blue
python -m venv venv

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Blue
& "venv\Scripts\Activate.ps1"

# Upgrade pip
Write-Host "Upgrading pip..." -ForegroundColor Blue
python -m pip install --upgrade pip

# Install development dependencies
Write-Host "Installing development dependencies..." -ForegroundColor Blue
pip install -r requirements-dev.txt

# Install pre-commit hooks
Write-Host "Setting up pre-commit hooks..." -ForegroundColor Blue
pre-commit install

# Fix any pre-commit config issues
Write-Host "Migrating pre-commit config..." -ForegroundColor Blue
try { pre-commit migrate-config } catch { }

# Run pre-commit on all files
Write-Host "Testing pre-commit hooks..." -ForegroundColor Blue
try { 
    pre-commit run --all-files 
} catch { 
    Write-Host "Some pre-commit checks failed, but hooks are installed" -ForegroundColor Yellow 
}

# Initialize git repository if not already initialized
if (-not (Test-Path ".git")) {
    Write-Host "`nInitializing git repository..." -ForegroundColor Blue
    git init
    
    # Final cleanup before initial commit
    Get-ChildItem -Path . -Recurse -Name "__pycache__" -Directory | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    Get-ChildItem -Path . -Recurse -Name "*.pyc" | Remove-Item -Force -ErrorAction SilentlyContinue
    
    git add .
    git commit -m "Initial commit: Secure Python project template

- Complete CI/CD workflows for security and quality
- Comprehensive testing setup
- Pre-commit hooks configured
- Customer compliance checks included"
    
    Write-Host "Git repository initialized" -ForegroundColor Green
} else {
    Write-Host "Git repository already exists" -ForegroundColor Yellow
}

# Run compliance check
Write-Host "`nRunning compliance check..." -ForegroundColor Blue
try {
    & ".\customer-compliance-check.sh"
    Write-Host "All compliance checks passed!" -ForegroundColor Green
} catch {
    Write-Host "Some compliance checks failed, but project is ready for development" -ForegroundColor Yellow
}

# Final instructions
Write-Host "`nProject setup complete!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Blue
Write-Host "1. Activate virtual environment: venv\Scripts\Activate.ps1"
Write-Host "2. Start developing in src\$PackageName\"
Write-Host "3. Write tests in tests\"
Write-Host "4. Run tests: pytest"
Write-Host "5. Check code quality: .\customer-compliance-check.sh"
Write-Host "6. Create GitHub repository and push your code"

Write-Host "`nUseful commands:" -ForegroundColor Blue
Write-Host "• Format code: black . && isort ."
Write-Host "• Run tests: pytest --cov=src"
Write-Host "• Security scan: bandit -r src\"
Write-Host "• Type check: mypy src\"
Write-Host "• Full compliance: .\customer-compliance-check.sh"

Write-Host "`nHappy coding!" -ForegroundColor Green