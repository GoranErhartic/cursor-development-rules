# Cursor Rules - Enterprise Backend Engineering Suite

[![Ko-fi](https://img.shields.io/badge/Support%20on-Ko--fi-FF5E5B?style=flat&logo=ko-fi)](https://ko-fi.com/goranlegenda)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/GoranErhartic/cursor-rules/graphs/commit-activity)

> A production-ready, extensible rule system for Cursor AI that transforms your coding assistant into a Senior Principal Backend Engineer with 20+ years of enterprise experience.

## 🎯 What is This?

This repository contains a comprehensive, language-agnostic rule system for [Cursor AI](https://cursor.sh/) that enforces:

- ✅ **Test-Driven Development (TDD)** workflows
- ✅ **Clean Architecture** and SOLID principles
- ✅ **Enterprise security** best practices
- ✅ **Production-grade** error handling and logging
- ✅ **CQRS** and Domain-Driven Design patterns
- ✅ **Multi-language support** (C#/.NET, Java/Spring Boot, and more)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/GoranErhartic/cursor-rules.git
cd cursor-rules
```

### 2. Copy to Your Project

Copy the `.cursor` folder to the root of your project:

```bash
cp -r .cursor /path/to/your/project/
```

### 3. Start Coding

Open your project in Cursor, and the AI will automatically:
- Act as a Senior Principal Backend Engineer
- Follow TDD workflows
- Apply language-specific best practices
- Enforce security and quality standards

## 📁 Structure

```
.cursor/rules/
├── patterns/                  # Language-agnostic patterns & concepts
│   ├── architecture.mdc       # Clean Architecture, CQRS, DDD, SOLID
│   ├── error-handling.mdc     # Result pattern, RFC 7807
│   ├── testing.mdc            # TDD workflow, AAA pattern
│   ├── security.mdc           # Security principles
│   ├── api-design.mdc         # REST conventions
│   ├── input-sanitization.mdc # Validation concepts
│   └── cqrs.mdc               # Command/Query separation
│
├── development/               # Development workflow
│   ├── tdd-planning.mdc       # Test planning requirements
│   └── code-implementation.mdc # Implementation workflow
│
└── languages/                 # Language-specific implementations
    ├── csharp/                # .NET / C# (14 files)
    ├── java/                  # Java / Spring Boot (14 files)
    └── _template/             # Template for adding new languages
        └── README.md          # Instructions for new languages
```

## 🌟 Key Features

### 🤖 AI Persona

The AI agent operates as a **Senior Principal Backend Engineer** with:
- 20+ years of enterprise experience
- Deep knowledge of distributed systems
- High-availability production environment expertise
- Strong emphasis on asking clarifying questions (never assumes!)

### 🧪 Test-Driven Development (TDD)

Enforces a strict TDD workflow:
1. **RED** - Write a failing test
2. **GREEN** - Minimal code to pass
3. **REFACTOR** - Clean up while keeping tests green

### 🏗️ Architecture Patterns

Built-in support for:
- **Vertical Slice Architecture** - Organize by feature, not layer
- **Clean Architecture** - Domain, Application, Infrastructure, API
- **CQRS** - Command/Query separation
- **Domain-Driven Design** - Aggregates, Value Objects, Domain Events

### 🛡️ Security First

Comprehensive security guidance:
- Input validation and sanitization
- SQL injection, XSS, and path traversal prevention
- Secrets management (no hardcoded credentials)
- HTTPS, CORS, and security headers
- JWT and OAuth2 patterns

### 📊 Code Quality

Enforces modern language features and best practices:
- C# 14 / .NET 10 idioms
- Java 21 features (records, sealed classes, pattern matching)
- Nullable reference types
- Async/await patterns
- Structured logging

## 🌍 Supported Languages

### C# / .NET

**14 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Core** | `code-quality`, `testing`, `error-handling`, `dependencies` |
| **Web** | `controllers`, `validation`, `input-sanitization` |
| **Data** | `ef-core` (Entity Framework Core) |
| **Infrastructure** | `logging` (Serilog), `resilience` (Polly), `messaging` (Rebus) |
| **Patterns** | `mediator` (CQRS), `auth` (JWT Bearer) |
| **Security** | `security`, `auth` |

**Technologies:**
- .NET 10, ASP.NET Core
- Entity Framework Core
- FluentValidation
- Serilog (structured logging)
- Polly (resilience patterns)
- Rebus (messaging)
- xUnit, FluentAssertions, Moq

### Java / Spring Boot

**14 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Core** | `code-quality`, `testing`, `error-handling`, `dependencies` |
| **Web** | `controllers`, `validation`, `input-sanitization` |
| **Data** | `jpa` (Spring Data JPA) |
| **Infrastructure** | `logging` (SLF4J/Logback), `resilience` (Resilience4j), `messaging` (Spring Cloud Stream) |
| **Patterns** | `cqrs`, `auth` (Spring Security) |
| **Security** | `security`, `auth` |

**Technologies:**
- Java 21, Spring Boot 3
- Spring Data JPA
- Jakarta Bean Validation
- SLF4J, Logback, Micrometer
- Resilience4j (circuit breaker, retry)
- Spring Cloud Stream (Kafka, RabbitMQ)
- JUnit 5, AssertJ, Mockito

## 🔧 How It Works

### Always Applied Rules

Core behavioral rules are always active:
- Agent persona and behavior
- TDD workflow requirements
- Rule flagging and retrospectives

### Pattern Rules

Language-agnostic concepts in `patterns/` define:
- **What** patterns to use
- **When** to apply them
- Universal best practices

### Language-Specific Rules

Files in `languages/*/` activate based on file extensions:
- `**/*.cs` → C# rules
- `**/*.java` → Java rules
- Implementation details for each pattern

## 🎨 Adding a New Language

The system is designed to be easily extensible. See [`.cursor/rules/languages/_template/README.md`](.cursor/rules/languages/_template/README.md) for detailed instructions.

**Quick steps:**

1. Create `languages/your-language/` folder
2. Create `.mdc` files for your language's patterns
3. Set appropriate `globs` for file matching
4. Reference universal patterns from `../../patterns/`
5. Focus on language-specific implementations

**Example languages to add:**
- Python (FastAPI, Django, Flask)
- TypeScript (Express, NestJS, Fastify)
- Go (Gin, Echo, Fiber)
- Rust (Actix, Rocket, Axum)
- PHP (Laravel, Symfony)
- Ruby (Rails, Sinatra)

## 📝 Rule File Format

Each `.mdc` file uses frontmatter and Markdown:

```markdown
---
description: "Brief description"
globs: ["**/*.ext"]           # Optional: when to apply
alwaysApply: true             # Optional: always active
---

# Title

## Content
Rule content in Markdown...

**See also:** Links to related rules
```

## 🎓 What You Get

### Definition of Done

Every task ensures:
- ✅ Project builds without errors/warnings
- ✅ All tests pass
- ✅ No secrets exposed
- ✅ Changes documented with clear reasoning

### Code Review Process

Built-in iterative code review:
1. Complete task
2. Identify improvements
3. Implement optimizations
4. Repeat until satisfied

### Retrospective Protocol

After each task, the AI evaluates:
- Rule effectiveness
- Gaps encountered
- Contradictions
- Improvement proposals

## 💡 Benefits

| Benefit | Description |
|---------|-------------|
| **Single Source of Truth** | One place for all rule definitions |
| **Easy Discovery** | Clear, hierarchical folder structure |
| **Language Agnostic** | Patterns work for any language |
| **Maintainable** | Changes to patterns cascade to all languages |
| **Scalable** | Simple to add new languages and patterns |
| **Consistent** | Same methodologies across all languages |

## 🤝 Contributing

Contributions are welcome! Whether you want to:

- 🌐 Add a new language
- 📚 Improve existing rules
- 🐛 Fix issues or gaps
- 💡 Suggest new patterns

Please feel free to:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### When Adding Rules

- **Universal concepts** → `patterns/`
- **Language-specific** → `languages/{lang}/`
- **Always-active rules** → root level with `alwaysApply: true` (rare)
- **Development workflow** → `development/` (rare)

## 💖 Support

If you find this project helpful, consider supporting its development:

[![Ko-fi](https://img.shields.io/badge/Support%20on-Ko--fi-FF5E5B?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/goranlegenda)

Your support helps maintain and expand this rule system with:
- 🆕 New language support
- 📖 Better documentation
- 🐛 Bug fixes and improvements
- 🎯 New patterns and best practices

**Every contribution matters!** Even a small coffee helps keep this project maintained and growing. ☕

### Other Ways to Support

- ⭐ Star this repository
- 🐛 Report issues and bugs
- 💡 Suggest improvements
- 📢 Share with others
- 🤝 Contribute code or documentation

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built for the [Cursor](https://cursor.sh/) AI-powered IDE
- Inspired by enterprise backend engineering best practices
- Community-driven development and continuous improvement

## 📞 Contact

- **Maintainer:** [@GoranErhartic](https://github.com/GoranErhartic)
- **Issues:** [GitHub Issues](https://github.com/GoranErhartic/cursor-rules/issues)
- **Support:** [Ko-fi](https://ko-fi.com/goranlegenda)

---

**Made with ❤️ for the Cursor community**

⭐ **If this project helps you, please consider starring it!** ⭐

