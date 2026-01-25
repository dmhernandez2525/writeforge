# WriteForge Coding Standards

## Critical Rules - Auto-Reject Patterns

These patterns will cause immediate PR rejection. No exceptions.

### TypeScript/JavaScript

```typescript
// NEVER USE:
any                    // Use specific types or unknown
@ts-ignore            // Fix the actual type error
@ts-expect-error      // Only acceptable with explanation comment
eslint-disable        // Follow lint rules or configure properly
console.log           // Use logger service
alert()               // Use notification system
// TODO:              // Create GitHub issue instead
```

### Swift (macOS Desktop)

```swift
// NEVER USE:
force unwrap (!)      // Use optional binding: if let, guard let
try!                  // Use do-catch or throws
implicitlyUnwrapped   // Make optional explicit
print()               // Use os.log Logger
```

### Rust (Linux Desktop)

```rust
// NEVER USE:
unwrap()              // Use ? operator or expect() with message
panic!()              // Return Result instead
unsafe                // Requires explicit justification in PR
```

---

## TypeScript Component Structure

### Preact Components (Browser Extension)

```typescript
// packages/extension/src/content/components/SuggestionCard.tsx
import { h, FunctionComponent } from 'preact';
import { useState, useCallback } from 'preact/hooks';
import { cn } from '@/lib/utils';
import { logger } from '@/lib/logger';
import type { Suggestion } from '@/types';

interface SuggestionCardProps {
  suggestion: Suggestion;
  onAccept: () => void;
  onDismiss: () => void;
  className?: string;
}

export const SuggestionCard: FunctionComponent<SuggestionCardProps> = ({
  suggestion,
  onAccept,
  onDismiss,
  className,
}) => {
  const [isHovered, setIsHovered] = useState(false);

  const handleAccept = useCallback(() => {
    logger.debug('suggestion.accept', { type: suggestion.type, id: suggestion.id });
    onAccept();
  }, [suggestion, onAccept]);

  const handleDismiss = useCallback(() => {
    logger.debug('suggestion.dismiss', { type: suggestion.type, id: suggestion.id });
    onDismiss();
  }, [suggestion, onDismiss]);

  return (
    <div
      className={cn('wf-suggestion-card', className)}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      <div className="wf-suggestion-content">
        <span className="wf-original">{suggestion.original}</span>
        <span className="wf-arrow">→</span>
        <span className="wf-replacement">{suggestion.replacement}</span>
      </div>
      <p className="wf-explanation">{suggestion.explanation}</p>
      <div className="wf-actions">
        <button onClick={handleAccept} className="wf-btn-accept">
          Accept
        </button>
        <button onClick={handleDismiss} className="wf-btn-dismiss">
          Dismiss
        </button>
      </div>
    </div>
  );
};
```

### Service Classes

```typescript
// packages/core/grammar/src/LanguageToolService.ts
import { logger } from '@writeforge/logger';
import type { GrammarCheck, GrammarIssue, CheckOptions } from './types';

export class LanguageToolService {
  private readonly baseUrl: string;
  private readonly timeout: number;

  constructor(options: { baseUrl?: string; timeout?: number } = {}) {
    this.baseUrl = options.baseUrl ?? 'http://localhost:8010';
    this.timeout = options.timeout ?? 5000;
  }

  async check(text: string, options: CheckOptions = {}): Promise<GrammarCheck> {
    const { language = 'en-US', disabledRules = [] } = options;

    logger.debug('languagetool.check.start', { textLength: text.length, language });

    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), this.timeout);

    try {
      const response = await fetch(`${this.baseUrl}/v2/check`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({
          text,
          language,
          disabledRules: disabledRules.join(','),
        }),
        signal: controller.signal,
      });

      if (!response.ok) {
        throw new Error(`LanguageTool API error: ${response.status}`);
      }

      const data = await response.json();
      const issues = this.parseMatches(data.matches);

      logger.debug('languagetool.check.complete', { issueCount: issues.length });

      return { text, language, issues };
    } finally {
      clearTimeout(timeoutId);
    }
  }

  private parseMatches(matches: unknown[]): GrammarIssue[] {
    // Implementation...
    return [];
  }
}
```

---

## Swift Component Structure (macOS)

```swift
// packages/desktop-mac/WriteForge/Services/GrammarService.swift
import Foundation
import os.log

/// Service for performing grammar checks via LanguageTool
final class GrammarService {
    private let logger = Logger(subsystem: "com.writeforge.app", category: "grammar")
    private let languageTool: LanguageToolClient
    private let queue = DispatchQueue(label: "com.writeforge.grammar", qos: .userInitiated)

    init(languageTool: LanguageToolClient) {
        self.languageTool = languageTool
    }

    /// Check text for grammar issues
    /// - Parameters:
    ///   - text: The text to check
    ///   - language: Language code (default: en-US)
    /// - Returns: Array of grammar issues found
    func check(text: String, language: String = "en-US") async throws -> [GrammarIssue] {
        logger.debug("Checking text of length \(text.count) for language \(language)")

        guard !text.isEmpty else {
            return []
        }

        let result = try await languageTool.check(text: text, language: language)

        logger.debug("Found \(result.count) issues")
        return result
    }
}
```

---

## Testing Requirements

### Browser Extension (Vitest + Playwright)

```typescript
// packages/extension/src/__tests__/SuggestionCard.test.tsx
import { describe, it, expect, vi } from 'vitest';
import { render, fireEvent } from '@testing-library/preact';
import { SuggestionCard } from '../content/components/SuggestionCard';

describe('SuggestionCard', () => {
  const mockSuggestion = {
    id: 'test-1',
    type: 'grammar',
    original: 'their',
    replacement: 'there',
    explanation: 'Use "there" for location',
    offset: 0,
    length: 5,
  };

  it('renders suggestion content correctly', () => {
    const { getByText } = render(
      <SuggestionCard
        suggestion={mockSuggestion}
        onAccept={vi.fn()}
        onDismiss={vi.fn()}
      />
    );

    expect(getByText('their')).toBeTruthy();
    expect(getByText('there')).toBeTruthy();
    expect(getByText('Use "there" for location')).toBeTruthy();
  });

  it('calls onAccept when accept button clicked', () => {
    const onAccept = vi.fn();
    const { getByText } = render(
      <SuggestionCard
        suggestion={mockSuggestion}
        onAccept={onAccept}
        onDismiss={vi.fn()}
      />
    );

    fireEvent.click(getByText('Accept'));
    expect(onAccept).toHaveBeenCalledTimes(1);
  });
});
```

### Coverage Requirements

| Platform | Unit Tests | E2E Tests | Minimum Coverage |
|----------|------------|-----------|------------------|
| Browser Extension | Vitest | Playwright | 80% |
| macOS Desktop | XCTest | XCUITest | 70% |
| Windows Desktop | xUnit | WinAppDriver | 70% |
| Linux Desktop | cargo test | - | 70% |
| Core Packages | Vitest | - | 85% |

---

## File Naming Conventions

### TypeScript/JavaScript
- Components: `PascalCase.tsx` (e.g., `SuggestionCard.tsx`)
- Hooks: `useCamelCase.ts` (e.g., `useGrammarCheck.ts`)
- Services: `PascalCaseService.ts` (e.g., `LanguageToolService.ts`)
- Types: `types.ts` or `PascalCase.types.ts`
- Tests: `*.test.ts` or `*.spec.ts`
- Constants: `SCREAMING_SNAKE_CASE` within files

### Swift
- Files: `PascalCase.swift`
- Classes/Structs: `PascalCase`
- Functions/Properties: `camelCase`
- Constants: `camelCase` (Swift convention)

### Rust
- Files: `snake_case.rs`
- Modules: `snake_case`
- Types: `PascalCase`
- Functions/Variables: `snake_case`
- Constants: `SCREAMING_SNAKE_CASE`

---

## Commit Message Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvement
- `test`: Adding or correcting tests
- `chore`: Build process, auxiliary tools, libraries

### Scopes
- `extension`: Browser extension
- `desktop-mac`: macOS desktop app
- `desktop-win`: Windows desktop app
- `desktop-linux`: Linux desktop app
- `core`: Shared core packages
- `api`: Self-hosted API
- `docs`: Documentation

### Examples

```
feat(extension): add Google Docs integration

Implements content script injection for Google Docs canvas
rendering. Uses MutationObserver to detect text changes.

Closes #123
```

```
fix(core): handle LanguageTool timeout gracefully

Previously, requests that exceeded timeout would throw
unhandled exceptions. Now returns empty result with
warning log.
```

---

## Pull Request Checklist

Before submitting a PR, verify:

- [ ] All tests pass (`pnpm test`)
- [ ] No lint errors (`pnpm lint`)
- [ ] No `any` types introduced
- [ ] No `console.log` statements
- [ ] No hardcoded paths (use env vars or relative paths)
- [ ] Documentation updated if API changed
- [ ] Commit messages follow convention
- [ ] No secrets or credentials in code
- [ ] Coverage thresholds maintained
