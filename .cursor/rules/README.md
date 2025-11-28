# Unified Cursor Rules

This folder contains a unified, language-agnostic rule system for Cursor AI agents that supports multiple programming languages while maintaining shared methodologies.

## Structure

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

## How It Works

### Always Applied Rules
Files at the root level with `alwaysApply: true` in their frontmatter are active for all projects:
- Agent behavior and persona
- Development workflow requirements
- Any language-agnostic rules that should always be enforced

### Pattern Rules
Files in `patterns/` define language-agnostic concepts:
- What patterns to use (not how to implement them)
- When to apply each pattern
- Universal best practices

### Language-Specific Rules
Files in `languages/*/` activate based on file globs:
- C# files (`**/*.cs`) → activate `languages/csharp/` rules
- Java files (`**/*.java`) → activate `languages/java/` rules
- Implementation details for each pattern
- Language-specific tools and frameworks

## Supported Languages

### C# / .NET
- **Framework:** .NET 10, ASP.NET Core
- **Files:** 14 rule files covering EF Core, Controllers, FluentValidation, Serilog, Polly, Rebus, etc.
- **Activation:** `**/*.cs` files

### Java / Spring Boot
- **Framework:** Java 21, Spring Boot 3
- **Files:** 14 rule files covering JPA, Controllers, Bean Validation, SLF4J, Resilience4j, Spring Cloud Stream, etc.
- **Activation:** `**/*.java` files

## Adding a New Language

See `languages/_template/README.md` for detailed instructions.

Quick steps:
1. Create `languages/your-language/` folder
2. Create `.mdc` files following the template structure
3. Set appropriate `globs` for file matching
4. Reference universal patterns from `../../patterns/`
5. Focus on language-specific implementations

## Key Features

### 🔄 Extensible
- Easy to add new languages
- Template and documentation provided
- Shared patterns reduce duplication

### 🎯 Focused
- Core rules always apply
- Patterns define concepts
- Languages show implementations

### 🔗 Cross-Referenced
- Pattern files link to language implementations
- Language files reference universal patterns
- Clear separation of concerns

### 📐 Consistent
- Same methodologies across all languages
- TDD-first approach
- Architecture principles shared

## Rule File Format

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

## Migration from Old Structure

This unified structure replaces the previous separate `.cursor/rules/` (C#) and `.cursor/spring-rules/` (Java) folders. All content has been:
- ✅ Preserved and migrated
- ✅ Organized by language
- ✅ Universal patterns extracted
- ✅ Cross-references updated

## Benefits

1. **Single Source of Truth** - One place for all rule definitions
2. **Easy Discovery** - Clear folder structure
3. **Language Agnostic** - Patterns work for any language
4. **Maintainable** - Changes to patterns cascade to all languages
5. **Scalable** - Simple to add new languages

## Examples

### Pattern Reference
`patterns/architecture.mdc` defines Clean Architecture principles universally.

### Language Implementation
- `languages/csharp/ef-core.mdc` shows how to implement with Entity Framework
- `languages/java/jpa.mdc` shows how to implement with Spring Data JPA

### Development Workflow
`development/tdd-planning.mdc` and `development/code-implementation.mdc` define workflows for all languages.

## Contributing

When adding new rules:
1. Universal concepts → `patterns/`
2. Language-specific → `languages/{lang}/`
3. Always-active rules → root level with `alwaysApply: true` (rare)
4. Development workflow → `development/` (rare)

## Questions?

- **New language?** → See `languages/_template/README.md`
- **New pattern?** → Add to `patterns/` then implement in languages
- **Always-active rule?** → Add to root with `alwaysApply: true` frontmatter
- **Development workflow?** → Update files in `development/`

