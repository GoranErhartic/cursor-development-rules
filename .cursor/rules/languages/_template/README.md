# Adding a New Language to Cursor Rules

This template provides guidance for adding support for a new programming language to the unified Cursor rules framework.

## Overview

The rules system is organized into:
- **Root level** - Always-active rules with `alwaysApply: true` (rare)
- **`patterns/`** - Universal software patterns and concepts
- **`development/`** - Development workflow rules
- **`languages/`** - Language-specific implementations

## Steps to Add a New Language

### 1. Create Language Folder

Create a new folder in `languages/` for your language:

```
languages/
  └── your-language/   # e.g., python, typescript, go, rust
```

### 2. Determine Required Files

Based on the patterns you're implementing, create corresponding language-specific files:

#### Core Files (Recommended for all languages)
- `code-quality.mdc` - Language idioms, naming conventions, best practices
- `testing.mdc` - Testing frameworks and patterns
- `dependencies.mdc` - Package management
- `error-handling.mdc` - Language-specific error handling

#### API/Web Files (For web frameworks)
- `controllers.mdc` - HTTP endpoint patterns
- `validation.mdc` - Request validation
- `input-sanitization.mdc` - Security sanitization

#### Data Access Files (For database-backed apps)
- `orm.mdc` or `database.mdc` - Database access patterns

#### Infrastructure Files (As needed)
- `logging.mdc` - Structured logging
- `cqrs.mdc` - CQRS implementation
- `resilience.mdc` - Retry, circuit breaker patterns
- `messaging.mdc` - Message queue integration

#### Security Files
- `auth.mdc` - Authentication and authorization
- `security.mdc` - Security best practices

### 3. File Template Structure

Each `.mdc` file should follow this structure:

```markdown
---
description: "Brief description of what this rule file covers"
globs: ["**/*.ext", "**/specific-path/**/*.ext"]
---

# Title

## Overview
Brief introduction to the pattern or concept.

## Implementation
Language-specific implementation details with code examples.

## Conventions
- Bullet point conventions
- Specific to this language/framework

## Examples
```language
// Code examples showing best practices
```

## Anti-Patterns
- ❌ Things to avoid
- ❌ Common mistakes

**See also:** Links to related pattern files and other language files
```

### 4. Configure Globs

The `globs` field in the frontmatter determines when rules are applied:

```yaml
globs: ["**/*.py", "**/test_*.py", "**/*_test.py"]  # Python example
globs: ["**/*.ts", "**/*.tsx"]                      # TypeScript example
globs: ["**/*.go"]                                  # Go example
```

### 5. Reference Universal Patterns

Link to language-agnostic patterns from `../../patterns/`:

```markdown
**See also:** 
- `../../patterns/architecture.mdc` - Overall architecture concepts
- `../../patterns/error-handling.mdc` - Result pattern concepts
- `error-handling.mdc` - Language-specific error handling implementation
```

### 6. Example: Python Structure

```
languages/python/
├── code-quality.mdc          # PEP 8, type hints, f-strings
├── dependencies.mdc          # pip, Poetry, requirements.txt
├── testing.mdc               # pytest, unittest, fixtures
├── error-handling.mdc        # Exception handling, Result types
├── controllers.mdc           # Flask/FastAPI/Django patterns
├── validation.mdc            # Pydantic, dataclasses
├── orm.mdc                   # SQLAlchemy, Django ORM
├── logging.mdc               # logging module, structlog
├── auth.mdc                  # Flask-Login, FastAPI security
└── security.mdc              # OWASP for Python
```

### 7. Example: TypeScript Structure

```
languages/typescript/
├── code-quality.mdc          # ESLint, TypeScript best practices
├── dependencies.mdc          # npm, yarn, pnpm
├── testing.mdc               # Jest, Vitest, Testing Library
├── error-handling.mdc        # Try/catch, Result types
├── controllers.mdc           # Express, NestJS, Fastify
├── validation.mdc            # Zod, class-validator, Yup
├── orm.mdc                   # TypeORM, Prisma, Drizzle
├── logging.mdc               # Winston, Pino
├── auth.mdc                  # Passport, JWT strategies
└── security.mdc              # CORS, helmet, input validation
```

## Best Practices

### 1. Focus on Language Specifics
- Don't repeat universal concepts from `patterns/`
- Reference pattern files instead of duplicating
- Focus on HOW to implement, not WHAT to implement

### 2. Provide Code Examples
- Show real, working code examples
- Include common patterns and idioms
- Demonstrate anti-patterns to avoid

### 3. Be Opinionated
- Recommend specific libraries/frameworks
- Explain WHY certain approaches are preferred
- Provide decision criteria for alternatives

### 4. Cross-Reference
- Link to related pattern files
- Link to other language-specific files
- Link to official documentation

### 5. Keep Current
- Update for new language versions
- Remove deprecated patterns
- Add emerging best practices

## Testing Your Rules

1. Create a sample project in your language
2. Verify that glob patterns match your files correctly
3. Test that rules provide helpful guidance
4. Ensure cross-references work correctly

## Examples to Study

Look at existing language implementations for reference:
- `languages/csharp/` - .NET / C# implementation
- `languages/java/` - Java / Spring Boot implementation

## Contributing

When adding a new language:
1. Create the folder structure
2. Write the `.mdc` files following the template
3. Test with real projects
4. Submit for review
5. Document any new patterns in `patterns/` if they're language-agnostic

## Questions?

- Review `patterns/` for universal concepts
- Study existing language implementations
- Focus on practical, actionable guidance

