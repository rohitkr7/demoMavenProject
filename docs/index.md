# Demo Maven Project Documentation

Welcome to the Demo Maven Project documentation. This project demonstrates a Java Maven application with integrated Git hooks for enforcing code quality standards.

## Table of Contents

1. [Getting Started](../README.md#getting-started)
2. [Calculator Documentation](calculator.md)
3. [Contributing Guidelines](../CONTRIBUTING.md)

## Project Structure

The project follows a standard Maven directory structure:

```
demoMavenProject/
├── .github/            # GitHub workflows and configuration
├── .githooks/          # Version-controlled Git hooks
├── docs/               # Documentation files
├── src/
│   ├── main/
│   │   ├── java/       # Java source code
│   │   └── resources/  # Application resources
│   └── test/
│       ├── java/       # Test source code
│       └── resources/  # Test resources
├── CONTRIBUTING.md     # Contribution guidelines
├── pom.xml             # Maven project configuration
└── README.md           # Project overview
```

## Key Features

- Java 11 based Maven project
- Calculator implementation with basic arithmetic operations
- SLF4J with Logback for logging
- Comprehensive JUnit and TestNG test coverage
- Git hooks for code quality enforcement
- CI/CD integration with Jenkins and GitHub Actions
