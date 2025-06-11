# Contributing to Demo Maven Project

Thank you for your interest in contributing to this project! Here are some guidelines to help you get started.

## Code of Conduct

Please be respectful and considerate of others when contributing to this project.

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests to ensure they pass (`./mvnw test`)
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Setup

1. Ensure you have Java 11 or higher installed
2. Install Git hooks: `./install_hooks.sh`
3. Build the project: `./mvnw clean install`

## Coding Standards

This project uses Checkstyle to enforce coding standards. Please ensure your code passes the Checkstyle checks:

```bash
./mvnw checkstyle:check
```

## Testing

All new features should include appropriate tests. Run tests using:

```bash
./mvnw test
```

## Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Reference issues and pull requests liberally after the first line
- When only changing documentation, include `[docs]` in the commit title

## Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update the version numbers in any examples files and the README.md to the new version
3. The PR will be merged once you have the sign-off of at least one maintainer

## License

By contributing, you agree that your contributions will be licensed under the project's license.
