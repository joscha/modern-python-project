# Modern Python Project Template

[![PyPI version](https://img.shields.io/pypi/v/modern-python-project)](https://pypi.org/project/modern-python-project/)

A comprehensive, production-ready Python project template
that incorporates modern development practices, tools, and workflows.
This template provides everything you need to start developing,
testing, and deploying Python packages with confidence.

## 🚀 Key Features & Advantages

### Development Environment

- **[devenv.sh](https://devenv.sh/)** - Reproducible development environments using Nix
- **Cross-platform support** - Works on macOS and Linux with conditional package loading
- **[direnv](https://direnv.net/docs/installation.html)** integration for automatic environment activation
- **Python 3.12** with modern tooling

### Package Management & Building

- **[uv](https://github.com/astral-sh/uv)** - Ultra-fast Python package installer and resolver
- **[hatchling](https://hatch.pypa.io/)** - Modern build backend
- **Dynamic versioning** from Git tags using `uv-dynamic-versioning`
- **Dependency groups** for clean separation of dev/prod dependencies

### Code Quality & Testing

- **[pytest](https://pytest.org/)** with async support and comprehensive plugins:
  - Coverage reporting with HTML output
  - Snapshot testing with [syrupy](https://github.com/tophat/syrupy)
  - Watch mode with [pytest-watcher](https://github.com/olzhasar/pytest-watcher)
- **[ruff](https://github.com/astral-sh/ruff)** - Lightning-fast linting and formatting
- **Pre-commit hooks** with comprehensive checks:
  - Code formatting (ruff-format)
  - Import sorting
  - TOML validation
  - Markdown formatting
  - Security scanning (trufflehog)
  - Shell script checking
  - Typo detection

### CI/CD & Publishing

- **GitHub Actions** workflow with:
  - Multi-OS testing (Ubuntu + macOS)
  - Automatic PyPI publishing on tags
  - Trusted publishing (no API keys needed)
  - Artifact storage
- **Renovate** for automated dependency updates
- **Semantic versioning** with automatic tag-based releases

### Documentation & Maintenance

- **Markdown linting** with customizable rules
- **License** (MIT) included
- **Comprehensive .gitignore** for Python projects
- **VS Code configuration** for optimal development experience

## 🛠 Setup Instructions

### Prerequisites

- [Nix](https://nixos.org/download.html) package manager
- [direnv](https://direnv.net/docs/installation.html) (recommended)

### Quick Start

1. **Clone and setup:**

   ```bash
   git clone <your-repo-url>
   cd modern-python-project
   direnv allow  # If using direnv
   # OR
   nix develop  # If not using direnv
   ```

1. **Install dependencies:**

   ```bash
   # Dependencies are automatically installed via devenv
   # But you can manually sync if needed:
   uv sync --all-extras
   ```

1. **Run tests:**

   ```bash
   test-all
   ```

1. **Start developing:**

   ```bash
   # Watch mode for tests
   test-watch

   # Format code
   format

   # Build package
   build
   ```

### Environment Setup Details

The development environment provides these commands:

- `build` - Build the Python package
- `format` - Run all formatters and linters
- `test-all` - Run the complete test suite
- `test-snapshot-update` - Update test snapshots
- `test-watch` - Run tests in watch mode
- `deps-upgrade` - Upgrade all dependencies

## 📁 Project Structure

```sh
modern-python-project/
├── modern_python_project/          # Main package code
│   ├── __init__.py
│   ├── main.py                     # CLI entry point
│   └── my_function.py             # Example module
├── modern_python_project_tests/    # Test package
│   ├── __snapshots__/             # Snapshot test files
│   ├── test_cli.py               # CLI tests
│   └── test_my_function.py       # Module tests
├── devenv.nix                     # Development environment config
├── devenv.yaml                    # devenv input configuration
├── pyproject.toml                 # Project metadata and tool config
├── uv.lock                        # Locked dependencies
└── README.md                      # This file
```

## 🔧 Configuration

### Python Dependencies

Dependencies are managed in `pyproject.toml`:

- **Main dependencies:** Listed under `dependencies`
- **Development dependencies:** Listed under `dependency-groups.dev`

### Testing Configuration

- **Coverage:** Configured to maintain 80% minimum coverage
- **Pytest:** Async support enabled, comprehensive reporting
- **Snapshots:** Automatic snapshot testing for CLI and functions

### Code Quality

- **Ruff:** Fast linting and formatting with import sorting
- **Pre-commit:** Comprehensive hooks for code quality
- **Coverage:** HTML reports generated in `coverage_html/`

## 🚀 Development Workflow

1. **Make changes** to your code
1. **Run tests** with `test-watch` for immediate feedback
1. **Format code** with `format` before committing
1. **Commit changes** - pre-commit hooks will run automatically
1. **Push to GitHub** - CI will run tests on multiple platforms
1. **Create release** by pushing a tag (format: `vX.X.X`)

## 📦 Publishing

Publishing to PyPI is fully automated:

1. Create a new tag: `git tag v1.0.0`
1. Push the tag: `git push origin v1.0.0`
1. GitHub Actions will automatically build and publish to PyPI

The project uses trusted publishing, so no API keys are required.

## 🌟 Why This Template?

This template embodies modern Python development best practices:

- **Fast feedback loops** with watch mode testing
- **Consistent code quality** with automated formatting and linting
- **Reliable builds** with locked dependencies and reproducible environments
- **Secure publishing** with trusted publishing and no stored secrets
- **Cross-platform support** with conditional package loading
- **Comprehensive testing** with coverage tracking and snapshot testing
- **Automated maintenance** with dependency updates and security scanning

Perfect for both solo projects and team development, this template scales
from simple scripts to complex packages while maintaining development velocity and code quality.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
1. Create a feature branch
1. Make your changes
1. Run the test suite
1. Submit a pull request

The pre-commit hooks and CI will ensure code quality and test coverage.
