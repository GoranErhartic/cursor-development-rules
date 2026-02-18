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
- ✅ **Multi-language support** (C#/.NET, Java/Spring Boot, Node.js/TypeScript, React, and more)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/GoranErhartic/cursor-rules.git
cd cursor-rules
```

### 2. Install to Your Project

#### Option A: Automated Installation (Recommended)

**macOS / Linux:**

```bash
./install.sh /path/to/your/project
```

**Windows PowerShell:**

```powershell
.\install.ps1 -TargetPath "C:\Path\To\Your\Project"
```

The installer will:
- ✅ Automatically backup existing rules (if any)
- ✅ Copy all rules to your project
- ✅ Show clear success/error messages

#### Option B: Manual Installation

Copy the `.cursor` folder to the root of your project:

```bash
# macOS / Linux
cp -r .cursor /path/to/your/project/

# Windows PowerShell
Copy-Item -Path .cursor -Destination C:\Path\To\Your\Project\ -Recurse
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
├── rule-index.mdc             # Agent-requestable: Master index of all rules and stack routers
├── agent-behavior.mdc         # Always-applied: Persona, Never Assume, Rule Flagging
├── retrospective.mdc          # Agent-requestable: End-of-task review, rule improvement protocol
├── README.md                  # Rules directory documentation
│
├── patterns/                  # Language-agnostic concepts (agent-requestable)
│   ├── architecture.mdc       # Clean Architecture, CQRS, DDD, SOLID
│   ├── clean-code.mdc         # Index to clean-code sub-rules
│   ├── clean-code-naming.mdc  # Naming, vocabulary, abbreviations
│   ├── clean-code-functions.mdc # Method params, guard clauses, cognitive load
│   ├── clean-code-design.mdc  # Side effects, immutability, Law of Demeter
│   ├── clean-code-hygiene.mdc # Dead code, magic numbers, comments, fail fast
│   ├── error-handling.mdc     # Result pattern, RFC 7807
│   ├── testing.mdc            # TDD workflow, AAA pattern
│   ├── security.mdc           # Security principles
│   ├── api-design.mdc         # REST conventions
│   ├── input-sanitization.mdc # Validation concepts
│   └── cqrs.mdc               # Command/Query separation
│
├── development/               # Development workflow (agent-requestable)
│   ├── tdd-workflow.mdc       # TDD Red/Green/Refactor mandate
│   ├── tdd-planning.mdc       # Test planning requirements
│   ├── code-implementation.mdc # Implementation workflow
│   ├── code-review.mdc        # Code review loop, DoD, checklist
│   └── context7-docs.mdc       # Context7 MCP documentation lookup
│
└── languages/                 # Language-specific implementations
    ├── aws-lambda/            # AWS Lambda / CDK / TypeScript (33 files)
    ├── csharp/                # .NET / C# (15 files)
    ├── java/                  # Java / Spring Boot (18 files)
    ├── nodejs/                # Node.js / TypeScript (15 files)
    ├── react/                 # React / TypeScript (17 files)
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
- Java 25 LTS features (records, sealed classes, pattern matching, virtual threads)
- TypeScript 5.6+ strict mode, ESLint, Prettier
- Nullable reference types
- Async/await patterns
- Structured logging

## 🌍 Supported Languages

### C# / .NET

**15 comprehensive rule files** covering:

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

**18 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Core** | `code-quality`, `testing`, `error-handling`, `dependencies` |
| **Web** | `controllers`, `validation`, `input-sanitization`, `http-clients` |
| **Data** | `jpa` (Spring Data JPA), `aggregation` |
| **Infrastructure** | `logging` (SLF4J/Logback), `resilience` (Resilience4j), `messaging` (Spring Cloud Stream) |
| **Patterns** | `cqrs`, `bff-architecture`, `auth` (Spring Security) |
| **Security** | `security`, `auth` |

**Technologies:**
- Java 25 LTS, Spring Boot 3
- Spring Data JPA
- Jakarta Bean Validation
- SLF4J, Logback, Micrometer
- Resilience4j (circuit breaker, retry)
- Spring Cloud Stream (Kafka, RabbitMQ)
- JUnit 5, AssertJ, Mockito

### Node.js / TypeScript

**15 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Core** | `code-quality`, `testing`, `error-handling`, `dependencies` |
| **Web** | `controllers`, `validation`, `input-sanitization` |
| **Data** | `orm` (Prisma, Drizzle, TypeORM) |
| **Infrastructure** | `logging` (Pino, Winston), `resilience` (Cockatiel), `messaging` (BullMQ) |
| **HTTP** | `http-clients` (fetch, axios, undici) |
| **Security** | `security` (Helmet, CORS), `auth` (JWT, sessions) |

**Technologies:**
- Node.js 22+, TypeScript 5.6+
- Express, Fastify, NestJS, Hono
- Prisma, Drizzle ORM
- Zod (validation), class-validator
- Pino (structured logging)
- Cockatiel (resilience patterns)
- BullMQ (job queues)
- Vitest, Supertest, Testcontainers

### React / TypeScript

**17 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Core** | `code-quality`, `components`, `dependencies` |
| **State** | `state-management`, `data-fetching` |
| **UI** | `styling`, `forms`, `accessibility`, `routing` |
| **Quality** | `testing`, `error-handling`, `error-boundaries`, `performance` |
| **Security** | `security`, `validation`, `input-sanitization` |

**Technologies:**
- React 18+, TypeScript (React 19 idioms in code-quality)
- React Query / TanStack Query
- React Router v7
- React Hook Form, Zod
- Testing Library, Vitest
- Error Boundaries (granular fallback UI)

### AWS Lambda / CDK / TypeScript

**33 comprehensive rule files** covering:

| Category | Files |
|----------|-------|
| **Router** | `nodejs-lambda.mdc` (glob-activated when Lambda/CDK paths are open) |
| **Lambda** | `lambda-handlers`, `api-gateway-http-api`, `sqs-processing`, `sns-events`, `eventbridge`, `powertools-batch` |
| **Data** | `dynamodb`, `dynamodb-streams`, `rds-proxy`, `opensearch`, S3 presigned URLs (upload/download/validation/CDK) |
| **Infrastructure** | CDK (`cdk-infrastructure-queues`, `cdk-infrastructure-lambda`, `cdk-infrastructure-data`, `cdk-infrastructure-monitoring`), `cdk-testing`, `multi-environment`, `monitoring` |
| **Observability** | `logging-setup`, `logging-tracing`, `logging-tracing-capture`, `logging-metrics-correlation` |
| **Cross-cutting** | `error-handling`, `security`, `testing`, `idempotency`, `powertools-parameters`, `code-quality` |

**Technologies:**
- Node.js 22, TypeScript 5.7, AWS CDK
- Lambda, DynamoDB, SQS, SNS, EventBridge, API Gateway HTTP API, S3, OpenSearch, RDS Proxy
- Middy v7, Powertools (Logger, Metrics, Tracer, Parameters, Batch)
- Vitest 4, aws-sdk-client-mock, LocalStack 3.x

## 🔧 How It Works

Rules use a **router + on-demand** activation model to keep context small and relevant.

### Always Applied (two files)

- **`agent-behavior.mdc`** — Persona (Senior Principal Backend Engineer), Never Assume, Rule Flagging, and links to stack routers and workflow rules.
- **`project-context.mdc`** — Project-specific routing metadata (active stacks, directory→router mapping, key dependencies). Generated by project onboarding and loaded on every request.

### Glob-Activated Stack Routers (one per stack)

When you open a file in a given stack, **only that stack’s router** is auto-loaded (e.g. opening a `.tsx` file loads `react-frontend.mdc` only). The router is a short table-of-contents that lists which rule files to load for the current task. The agent then requests the 2–3 rules relevant to the sub-task.

| Stack | Router | Triggers when opening |
|-------|--------|------------------------|
| AWS Lambda / CDK | `languages/aws-lambda/nodejs-lambda.mdc` | `functions/`, `lambda/`, `handlers/`, `*.handler.ts`, `cdk/` |
| Node.js / TypeScript (base) | `languages/nodejs/nodejs-base.mdc` | `.ts`, `tsconfig.json`, `package.json` (excluding Lambda/React/CDK) |
| Java / Spring Boot | `languages/java/java-spring.mdc` | `.java`, `pom.xml`, `build.gradle*` |
| C# / .NET | `languages/csharp/csharp-dotnet.mdc` | `.cs`, `*.csproj`, `Directory.Build.props` |
| React / TypeScript | `languages/react/react-frontend.mdc` | `.tsx`, `vite.config.*`, `next.config.*` |

### Agent-Requestable Rules (on demand)

All other rules are **agent-requestable**: the agent sees their `description` and requests the file when needed. This includes all language-specific rules (handlers, SQS, DynamoDB, forms, etc.), all **pattern** rules (`patterns/*`), and **development** rules (TDD workflow, code review, context7 docs, retrospective). The agent uses the router’s rule-routing table and `rule-index.mdc` to discover which rules to load for the current sub-task.

**Token budget:** Only the router (~1k tokens) plus 2–4 on-demand rules load per sub-task, keeping rules context under ~15–20k tokens so most of the context window stays available for code and conversation.

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
- Go (Gin, Echo, Fiber)
- Rust (Actix, Rocket, Axum)
- PHP (Laravel, Symfony)
- Ruby (Rails, Sinatra)
- Kotlin (Ktor, Spring Boot)

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

### Validation

Before opening a PR, run:

```bash
./scripts/validate_rules.sh
```

CI also runs `.github/workflows/rules-validation.yml` on push/PR.

### When Adding Rules

- **Universal concepts** → `patterns/`
- **Language-specific** → `languages/{lang}/`
- **Always-active rules** → root level with `alwaysApply: true` (rare)
- **Development workflow** → `development/` (rare)

## 💖 Support

If you find this project helpful, consider supporting its development:

[![Ko-fi](https://img.shields.io/badge/Support%20on-Ko--fi-FF5E5B?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/goranlegenda)

[![PayPal](https://img.shields.io/badge/PayPal-Support-blue?logo=paypal&logoColor=white)](https://paypal.me/GoranLegenda)

**Or use PayPal directly:** [paypal.me/GoranLegenda](https://paypal.me/GoranLegenda)

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

