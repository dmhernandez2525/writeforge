# WriteForge Feature Backlog

**Version:** 1.0.0
**Last Updated:** January 2026

---

## Priority Definitions

| Priority | Definition | Timeline |
|----------|------------|----------|
| **P0** | Launch blocker - MVP must-have | Phase 1 (Months 1-3) |
| **P1** | Competitive parity - required for market viability | Phase 2 (Months 4-6) |
| **P2** | Differentiation - unique value proposition | Phase 3 (Months 7-12) |
| **P3** | Scale - enterprise and advanced features | Phase 4 (Months 13+) |

---

## P0 - MVP Features (Launch Blockers)

### Core Engine

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F1.1 | LanguageTool Integration | Grammar/spelling checking via local LanguageTool server | M | None |
| F1.1.1 | Docker Setup | docker-compose for LanguageTool with n-gram support | S | None |
| F1.1.2 | Client Library | TypeScript client for LanguageTool API | M | F1.1.1 |
| F1.1.3 | Error Classification | Categorize issues as grammar/spelling/style/punctuation | S | F1.1.2 |
| F1.1.4 | Suggestion Formatting | Format suggestions with explanations, offsets, replacements | S | F1.1.2 |
| F1.4 | Local LLM Integration | AI suggestions via Qwen2.5 models | L | None |
| F1.4.1 | llama.cpp Wrapper | Native integration for desktop apps | M | None |
| F1.4.2 | WebLLM Integration | Browser-based LLM via WebGPU | M | None |
| F1.4.3 | Model Management | Download, cache, and load GGUF models | M | F1.4.1, F1.4.2 |
| F1.4.4 | Prompt Templates | Prompts for grammar suggestions, rewriting, tone | S | F1.4.3 |
| F1.5 | Personal Dictionary | User-managed word list for technical terms | M | None |
| F1.5.1 | Add/Remove Words | Right-click and keyboard shortcut to manage | S | None |
| F1.5.2 | Dictionary Storage | chrome.storage.local (ext), SQLite (desktop) | S | None |
| F1.5.3 | Export/Import | JSON export for manual sync between platforms | S | F1.5.2 |

### Chrome Extension

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F1.2 | Chrome Extension Core | WXT-based extension with Preact UI | L | F1.1 |
| F1.2.1 | Textarea Support | Monitor and check textarea content | M | F1.1.2 |
| F1.2.2 | Contenteditable Support | Monitor and check contenteditable elements | M | F1.1.2 |
| F1.2.3 | Google Docs Integration | Canvas-based text extraction and overlay | L | F1.2.1, F1.2.2 |
| F1.2.4 | Gmail Compose | Rich text editor integration | M | F1.2.2 |
| F1.2.5 | Underline Rendering | Visual indicators (red/blue/yellow) for issues | M | F1.2.1 |
| F1.2.6 | Suggestion Cards | Popup UI showing suggestion details | M | F1.2.5 |
| F1.2.7 | Accept/Dismiss UI | Buttons to accept, dismiss, or ignore suggestions | S | F1.2.6 |
| F1.2.8 | Extension Popup | Status display, quick settings | M | None |
| F1.2.9 | Options Page | Full settings configuration | M | None |
| F1.2.10 | Offline Mode | Full functionality without internet | M | F1.1.2, F1.4.2 |

### macOS Desktop

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F1.3 | macOS Desktop Core | Swift/SwiftUI desktop application | L | F1.1 |
| F1.3.1 | Menu Bar Presence | Status icon with dropdown menu | S | None |
| F1.3.2 | Accessibility API | AXUIElement for system-wide text access | L | None |
| F1.3.3 | Floating Editor | Popup window for text checking | M | F1.3.2 |
| F1.3.4 | Keyboard Shortcut | Global Cmd+Shift+G to trigger check | S | F1.3.3 |
| F1.3.5 | LT Server Management | Start/stop embedded LanguageTool | M | F1.1.1 |
| F1.3.6 | Local LLM Inference | llama.cpp integration for AI features | L | F1.4.1 |

---

## P1 - Competitive Parity Features

### Cross-Browser Extensions

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F2.1 | Safari Extension | Safari-compatible build via WXT | M | F1.2 |
| F2.2 | Firefox Extension | Firefox-compatible build via WXT | M | F1.2 |
| F2.3 | Edge Extension | Edge-compatible (Chrome-based) | S | F1.2 |

### Windows Desktop

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F2.4 | Windows Desktop Core | C#/.NET 8 with WinUI 3 | L | F1.1 |
| F2.4.1 | System Tray | Tray icon with context menu | S | None |
| F2.4.2 | UI Automation | System-wide text access | L | None |
| F2.4.3 | Floating Editor | Popup window for checking | M | F2.4.2 |
| F2.4.4 | MS Office Integration | Word and Outlook add-ins | L | F2.4 |

### Enhanced AI

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F2.5 | Tone Detection | Identify formal/casual/confident/friendly tone | M | F1.4 |
| F2.6 | Tone Adjustment | Rewrite text to match target tone | M | F2.5 |
| F2.7 | Sentence Rewriting | Full sentence alternatives | M | F1.4 |
| F2.8 | Synonym Suggestions | Context-aware word alternatives | M | F1.4 |
| F2.9 | Vale Integration | Custom style rules engine | M | None |

### Writing Statistics

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F2.10 | Words Checked | Track daily/weekly/monthly volume | S | None |
| F2.11 | Error Patterns | Common mistake analysis | M | F2.10 |
| F2.12 | Improvement Tracking | Progress over time visualization | M | F2.11 |
| F2.13 | Readability Scores | Flesch-Kincaid, grade level | S | None |
| F2.14 | Statistics Dashboard | UI for viewing all metrics | M | F2.10-F2.13 |

### Sync Service (Optional)

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F2.15 | Dictionary Sync | E2E encrypted dictionary synchronization | M | F1.5 |
| F2.16 | Preferences Sync | Settings sync across devices | M | None |
| F2.17 | Statistics Sync | Historical data across platforms | M | F2.10 |

---

## P2 - Differentiation Features

### Linux Desktop

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F3.1 | Linux Desktop Core | Rust + GTK4 application | L | F1.1 |
| F3.1.1 | D-Bus Integration | Desktop environment integration | M | None |
| F3.1.2 | AT-SPI | Accessibility API for text access | L | None |
| F3.1.3 | System Tray | libappindicator integration | S | None |
| F3.1.4 | Clipboard Monitor | X11/Wayland clipboard tracking | M | None |
| F3.1.5 | CLI Interface | Terminal-based grammar checking | M | F1.1.2 |
| F3.1.6 | Package Formats | Flatpak, AppImage, .deb, .rpm | M | F3.1 |

### Mobile Keyboards

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F3.2 | iOS Keyboard | Custom keyboard extension | L | None |
| F3.2.1 | Autocorrect Suggestions | Inline grammar corrections | M | None |
| F3.2.2 | Companion App | Full analysis via separate app | M | F3.2 |
| F3.3 | Android Keyboard | Custom IME | L | None |
| F3.3.1 | Grammar Suggestions | Inline corrections | M | None |
| F3.3.2 | Small LLM (Optional) | ONNX-based inference | L | None |

### Developer API

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F3.4 | REST API Server | Node.js/Express API | M | F1.1 |
| F3.4.1 | Grammar Endpoint | /api/v1/check | S | F3.4 |
| F3.4.2 | AI Suggestions Endpoint | /api/v1/suggest | M | F1.4 |
| F3.4.3 | BYOK Support | User-provided AI API keys | M | F3.4.2 |
| F3.4.4 | Rate Limiting | Token-based rate limits | S | F3.4 |
| F3.4.5 | API Documentation | OpenAPI spec, developer portal | M | F3.4 |
| F3.5 | Python SDK | Python client library | M | F3.4 |
| F3.6 | JavaScript SDK | Node.js/browser client | M | F3.4 |
| F3.7 | Go SDK | Go client library | M | F3.4 |

### Team Features

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F3.8 | Shared Dictionaries | Team-wide custom word lists | M | F1.5 |
| F3.9 | Custom Style Guides | Organization-specific rules | M | F2.9 |
| F3.10 | Team Admin Dashboard | User management UI | L | None |
| F3.11 | Usage Analytics | Team-wide statistics | M | F2.10 |
| F3.12 | Invite System | Email invites, join codes | M | F3.10 |
| F3.13 | Billing Integration | Stripe subscription management | L | F3.10 |

---

## P3 - Scale Features

### Enterprise

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F4.1 | Self-Hosted Deployment | Docker/K8s deployment packages | L | F3.4 |
| F4.2 | SSO Integration | SAML, OIDC authentication | L | F3.10 |
| F4.3 | Audit Logging | Comprehensive activity logs | M | F3.10 |
| F4.4 | Data Residency | Region-specific data storage | L | F4.1 |
| F4.5 | SLA Tiers | Premium support levels | M | F3.13 |
| F4.6 | Custom LLM Fine-tuning | Organization-specific model training | XL | F1.4 |

### Advanced AI

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F4.7 | Plagiarism Detection | Local hash-based comparison | L | None |
| F4.8 | AI Detection | Identify AI-generated content | L | F1.4 |
| F4.9 | Full Document Rewrite | Complete document transformation | L | F2.7 |
| F4.10 | Citation Assistance | Format and verify citations | M | None |
| F4.11 | Translation Integration | Multi-language translation | M | None |
| F4.12 | Genre-Specific Suggestions | Academic, legal, medical modes | L | F2.9 |

### BYOK Cloud AI

| ID | Feature | Description | Effort | Dependencies |
|----|---------|-------------|--------|--------------|
| F4.13 | OpenAI Integration | GPT-4 via user's API key | M | None |
| F4.14 | Anthropic Integration | Claude via user's API key | M | None |
| F4.15 | Google Integration | Gemini via user's API key | M | None |
| F4.16 | BYOK Discount | 40% off subscription for BYOK users | S | F3.13 |
| F4.17 | Local LLM Fallback | Use local model when BYOK unavailable | S | F1.4 |

---

## Effort Estimation Key

| Size | Definition | Approximate Duration |
|------|------------|---------------------|
| **S** | Small - single component, well-defined | 1-2 days |
| **M** | Medium - multiple components, some complexity | 3-5 days |
| **L** | Large - significant feature, integration required | 1-2 weeks |
| **XL** | Extra Large - major subsystem, research required | 3-4 weeks |

---

## Feature Dependencies Graph

```
F1.1 (LanguageTool)
├── F1.2 (Chrome Extension) ─────┬── F2.1 (Safari)
│   ├── F1.2.1 (Textarea)        ├── F2.2 (Firefox)
│   ├── F1.2.2 (Contenteditable) └── F2.3 (Edge)
│   ├── F1.2.3 (Google Docs)
│   └── F1.2.4 (Gmail)
├── F1.3 (macOS Desktop)
│   └── F1.3.6 ── F1.4 (Local LLM)
│                  ├── F2.5 (Tone Detection)
│                  ├── F2.7 (Rewriting)
│                  └── F3.4.2 (AI API)
├── F2.4 (Windows Desktop)
├── F3.1 (Linux Desktop)
└── F3.4 (REST API)
    ├── F3.5 (Python SDK)
    ├── F3.6 (JS SDK)
    └── F3.7 (Go SDK)

F1.5 (Personal Dictionary)
├── F2.15 (Dictionary Sync)
└── F3.8 (Shared Dictionaries)

F2.9 (Vale Integration)
├── F3.9 (Custom Style Guides)
└── F4.12 (Genre-Specific)

F2.10 (Statistics)
├── F2.11 (Error Patterns)
├── F2.14 (Dashboard)
└── F3.11 (Team Analytics)
```

---

## Research-Backed Prioritization Rationale

### Why P0 includes these features:

| Feature | User Demand Evidence | Competitive Gap |
|---------|---------------------|-----------------|
| LanguageTool | "80-90% of Grammarly accuracy" - research | Self-hostable grammar |
| Chrome Extension | 65% browser market share | Must-have for reach |
| Google Docs | "Where people write most" - research | Grammarly has this |
| macOS Desktop | "Developer target audience" - research | System-wide access |
| Local LLM | "I'd pay double for local AI" - HN | No competitor has this |
| Personal Dictionary | Top 5 requested feature in reviews | Grammarly has this |
| Offline Mode | "100% offline" is core differentiator | Hemingway only competitor |

### Why Linux is P2 (not P1):

Despite being "completely unserved," Linux represents ~2-3% of desktop users. Chrome extension (P0) covers Linux users in browser. Native app in P2 captures enthusiast segment after proving core product.

### Why Mobile is P2:

iOS keyboard memory limit (30-50MB) severely constrains features. Research recommends: "Focus on autocorrect-style suggestions rather than full grammar checking." Better to deliver excellent desktop/browser first.

---

**Document Maintainer:** Product Team
**Review Cycle:** Bi-weekly
**Next Review:** February 2026
