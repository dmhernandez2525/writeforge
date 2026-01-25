# WriteForge Implementation Roadmap

**Version:** 1.0.0
**Last Updated:** January 2026
**Status:** Phase 1 Planning

---

## Strategic Context

### Market Opportunity

WriteForge enters a **$3.7 billion** writing assistant market where privacy is the dominant unaddressed concern:

| Insight | Source | Implication |
|---------|--------|-------------|
| Privacy is #1 complaint about Grammarly | HN, Reddit, G2 | Lead with "100% local" messaging |
| Microsoft has banned Grammarly internally | Research | Target enterprise IT teams |
| "I'd pay $49/year for fully offline Grammarly" | HN user | Price at $69/year (undercut Grammarly 52%) |
| Zero Linux desktop options exist | Competitor analysis | Capture unserved developer segment |
| LanguageTool acquired by US company (2024) | News | Privacy community seeking alternatives |

### Competitive Gaps WriteForge Fills

1. **Full-featured local AI** - No competitor combines local grammar + local LLM + cross-platform
2. **Linux desktop** - Zero competition
3. **HIPAA-compliant by architecture** - No BAA required (data never leaves device)
4. **No data training** - Mathematically impossible with local-first
5. **One-time purchase + AI** - Hemingway proves demand; ProWritingAid validates $399 lifetime

---

## Phase Overview

```
Phase 1: MVP (Months 1-3)
├── Chrome Extension with LanguageTool
├── macOS Desktop App
├── Local LLM Integration (Qwen2.5)
└── Personal Dictionary

Phase 2: Competitive Parity (Months 4-6)
├── Safari, Firefox Extensions
├── Windows Desktop App
├── Tone Detection & AI Rewriting
└── Writing Statistics

Phase 3: Differentiation (Months 7-12)
├── Linux Desktop App
├── iOS/Android Keyboards
├── REST API for Developers
└── Team Features

Phase 4: Scale (Months 13+)
├── Enterprise Portal
├── Plagiarism Detection (Local)
├── AI Detection Capability
└── BYOK Cloud AI
```

---

## Phase 1: MVP (Months 1-3)

**Goal:** Launch Chrome extension + macOS desktop with 100% local grammar checking and AI suggestions.

**Success Metrics:**
- Chrome Web Store rating: 4.5+ stars
- Suggestion latency: <100ms (grammar), <500ms (AI)
- Offline functionality: 100% feature parity
- Initial users: 1,000+ installs first month

### Milestone 1.1: Core Engine Foundation (Weeks 1-2)

**Deliverables:**
- [ ] LanguageTool client library (`@writeforge/core-grammar`)
- [ ] Docker setup for local LanguageTool server
- [ ] API abstraction layer for grammar checking
- [ ] Error type classification (grammar/spelling/style)
- [ ] Suggestion formatting with explanations

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| LanguageTool mode | Localhost server | Full functionality, easy Docker setup |
| Transport | HTTP REST | Simple, LanguageTool's native API |
| Caching | In-memory LRU | Reduce redundant checks |

**Dependencies:** None (first milestone)

### Milestone 1.2: Chrome Extension Core (Weeks 2-4)

**Deliverables:**
- [ ] WXT project setup with TypeScript + Preact
- [ ] Content script for textarea monitoring
- [ ] Content script for contenteditable monitoring
- [ ] Underline rendering (red=spelling, blue=grammar, yellow=style)
- [ ] Suggestion card component
- [ ] Accept/dismiss/ignore interactions
- [ ] Extension popup with status
- [ ] Options page for settings

**Google Docs Integration:**
- [ ] Canvas text extraction via accessibility APIs
- [ ] Cursor position tracking
- [ ] Overlay positioning for suggestions

**Gmail Integration:**
- [ ] Compose window detection
- [ ] Rich text editor handling

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| UI Framework | Preact | Lightweight (3KB), React-compatible |
| Styling | Tailwind CSS | Utility-first, small bundle with purge |
| State | Preact Signals | Simple, performant reactivity |
| Extension Framework | WXT | Modern DX, cross-browser from day 1 |

**Dependencies:** Milestone 1.1

### Milestone 1.3: macOS Desktop App Core (Weeks 3-6)

**Deliverables:**
- [ ] Swift project with SwiftUI
- [ ] Menu bar presence with status icon
- [ ] Accessibility API integration (AXUIElement)
- [ ] System-wide text extraction
- [ ] Floating editor window
- [ ] Global keyboard shortcut (Cmd+Shift+G)
- [ ] Background LanguageTool server management
- [ ] Native notification integration

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| UI Framework | SwiftUI + AppKit | Modern UI with Accessibility APIs |
| LT Integration | Embedded server | No Docker required for end users |
| Permissions | Accessibility + Input Monitoring | Required for system-wide access |

**Dependencies:** Milestone 1.1

### Milestone 1.4: Local LLM Integration (Weeks 5-8)

**Deliverables:**
- [ ] llama.cpp integration for desktop (`@writeforge/core-llm`)
- [ ] WebLLM integration for browser
- [ ] Qwen2.5-0.5B model for browser (GGUF, ~500MB)
- [ ] Qwen2.5-1.5B model for desktop (GGUF, ~1.2GB)
- [ ] Contextual suggestion prompts
- [ ] Tone detection (formal/casual/confident/friendly)
- [ ] Sentence rewriting capability
- [ ] Model download and caching
- [ ] Fallback when model unavailable

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| Desktop Runtime | llama.cpp | Best local inference performance |
| Browser Runtime | WebLLM | WebGPU acceleration, ~80% native perf |
| Model | Qwen2.5 family | Apache 2.0 license, good quality/size |
| Quantization | Q4_K_M | Balance of quality and speed |

**Dependencies:** Milestones 1.2, 1.3

### Milestone 1.5: Personal Dictionary (Weeks 7-9)

**Deliverables:**
- [ ] Add word to dictionary (right-click, keyboard shortcut)
- [ ] Remove word from dictionary
- [ ] Dictionary management UI
- [ ] Export/import dictionary (JSON)
- [ ] Sync dictionary between extension and desktop (local file)
- [ ] Technical terminology presets

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| Storage (Extension) | chrome.storage.local | Persistent, offline accessible |
| Storage (Desktop) | SQLite | Fast, single-file database |
| Sync (MVP) | File export/import | Simple, works offline |

**Dependencies:** Milestones 1.2, 1.3

### Milestone 1.6: Testing & Polish (Weeks 9-12)

**Deliverables:**
- [ ] Unit tests for core packages (85% coverage)
- [ ] E2E tests for Chrome extension (Playwright)
- [ ] UI tests for macOS app (XCUITest)
- [ ] Performance benchmarking
- [ ] Error handling and recovery
- [ ] Offline mode verification
- [ ] Chrome Web Store submission
- [ ] Mac App Store submission (optional, direct download first)

**Exit Criteria:**
- All P0 features implemented and tested
- <100ms grammar suggestion latency
- <500ms AI suggestion latency
- Zero data transmitted externally (verified via network monitoring)
- 4.5+ internal QA score

---

## Phase 2: Competitive Parity (Months 4-6)

**Goal:** Cross-browser support, Windows desktop, enhanced AI features.

**Success Metrics:**
- Firefox/Safari extension ratings: 4.5+
- Windows desktop stable release
- Tone detection accuracy: 85%+
- User retention: 70% at 30 days

### Milestone 2.1: Cross-Browser Extensions (Weeks 13-16)

**Deliverables:**
- [ ] Safari extension (WXT build target)
- [ ] Firefox extension (WXT build target)
- [ ] Edge extension (Chrome-compatible)
- [ ] Browser-specific API adaptations
- [ ] Extension store submissions

**Dependencies:** Phase 1 complete

### Milestone 2.2: Windows Desktop App (Weeks 15-20)

**Deliverables:**
- [ ] C#/.NET 8 project with WinUI 3
- [ ] System tray presence
- [ ] UI Automation for text access
- [ ] Floating editor window
- [ ] Global hotkey support
- [ ] MS Office integration (Word, Outlook)

**Dependencies:** Milestone 2.1

### Milestone 2.3: Enhanced AI Features (Weeks 17-22)

**Deliverables:**
- [ ] Tone detection and adjustment
- [ ] Full sentence rewriting
- [ ] Paragraph summarization
- [ ] Synonym suggestions
- [ ] Style consistency checking
- [ ] Vale integration for custom style rules

**Dependencies:** Milestones 2.1, 2.2

### Milestone 2.4: Writing Statistics (Weeks 20-24)

**Deliverables:**
- [ ] Words checked per day/week/month
- [ ] Common error patterns
- [ ] Improvement tracking over time
- [ ] Readability scores
- [ ] Dashboard UI (extension popup + desktop)

**Dependencies:** Milestone 2.3

---

## Phase 3: Differentiation (Months 7-12)

**Goal:** Linux support, mobile keyboards, developer API, team features.

**Success Metrics:**
- Linux user base: 5,000+
- API developer signups: 500+
- Mobile keyboard installs: 10,000+
- Team tier revenue: First paying teams

### Milestone 3.1: Linux Desktop App (Weeks 25-32)

**Deliverables:**
- [ ] Rust + GTK4 application
- [ ] D-Bus integration
- [ ] AT-SPI for accessibility
- [ ] System tray (libappindicator)
- [ ] Clipboard monitoring (X11/Wayland)
- [ ] Flatpak, AppImage, .deb, .rpm packages
- [ ] CLI interface for terminal users

**Technical Decisions:**
| Decision | Choice | Rationale |
|----------|--------|-----------|
| Language | Rust | Memory safety, performance, Linux ecosystem |
| UI | GTK4 + libadwaita | Native GNOME integration |
| Packaging | Flatpak primary | Sandboxed, cross-distro |

### Milestone 3.2: Mobile Keyboards (Weeks 28-40)

**iOS Keyboard:**
- [ ] Custom keyboard extension
- [ ] Autocorrect-style suggestions
- [ ] LanguageTool rules (memory-constrained)
- [ ] Companion app for full analysis
- [ ] Offline processing

**Android Keyboard:**
- [ ] Custom IME
- [ ] Grammar suggestions inline
- [ ] Small LLM via ONNX (optional)
- [ ] Companion app

**Note:** Mobile keyboards are memory-constrained (iOS: 30-50MB). Full LLM not feasible; focus on autocorrect-style suggestions.

### Milestone 3.3: REST API for Developers (Weeks 32-38)

**Deliverables:**
- [ ] Node.js + Express API server
- [ ] Grammar checking endpoint
- [ ] AI suggestions endpoint
- [ ] BYOK support (OpenAI, Anthropic keys)
- [ ] Docker deployment
- [ ] SDKs: Python, JavaScript, Go
- [ ] API documentation (OpenAPI spec)
- [ ] Rate limiting and auth

### Milestone 3.4: Team Features (Weeks 36-48)

**Deliverables:**
- [ ] Shared dictionaries
- [ ] Custom style guides
- [ ] Team admin dashboard
- [ ] Usage analytics
- [ ] Invite/manage team members
- [ ] Billing integration (Stripe)

---

## Phase 4: Scale (Months 13+)

**Goal:** Enterprise features, advanced AI, market expansion.

### Milestone 4.1: Enterprise Portal

- [ ] Self-hosted deployment packages (Docker, K8s)
- [ ] SSO integration (SAML, OIDC)
- [ ] Audit logging
- [ ] Data residency options
- [ ] SLA support tiers
- [ ] Custom LLM fine-tuning

### Milestone 4.2: Advanced AI Features

- [ ] Plagiarism detection (local hash comparison)
- [ ] AI-generated content detection
- [ ] Full document rewriting
- [ ] Citation assistance
- [ ] Translation integration
- [ ] Genre-specific suggestions (academic, legal, medical)

### Milestone 4.3: BYOK Cloud AI

- [ ] OpenAI GPT-4 integration
- [ ] Anthropic Claude integration
- [ ] Google Gemini integration
- [ ] User-provided API keys
- [ ] 40% subscription discount for BYOK
- [ ] Local LLM fallback

---

## Risk Mitigation

### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| LLM hallucinations | High | High | Clear "AI suggestion" labeling, easy reject |
| macOS Accessibility API restrictions | Medium | High | Browser extension as primary; desktop as enhancement |
| WebGPU adoption slower than expected | Low | Medium | WASM fallback for WebLLM |
| Google Docs canvas integration | Medium | Medium | Defer to P1 if complex; textarea/contenteditable first |

### Market Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Grammarly adds local mode | Medium | High | Emphasize open source, no lock-in |
| LanguageTool improves AI | Medium | Medium | Focus on integration, not just grammar |
| Apple improves built-in grammar | High | Low | AI rewriting differentiates |

---

## Resource Requirements

### Phase 1 (MVP)

| Role | Allocation | Focus |
|------|------------|-------|
| Full-stack TypeScript | 100% | Extension, core packages |
| Swift/macOS | 50% | Desktop app |
| DevOps | 25% | CI/CD, Docker |

### Phase 2+

| Role | Allocation | Focus |
|------|------------|-------|
| Full-stack TypeScript | 100% | Extension enhancements, API |
| Swift/macOS | 25% | Maintenance |
| C#/Windows | 50% | Desktop app |
| Rust/Linux | 50% | Desktop app |
| Mobile (Swift/Kotlin) | 50% | Keyboards |

---

## Pricing Strategy (Launch)

| Tier | Price | Features |
|------|-------|----------|
| **Free** | $0 | LanguageTool grammar (30+ languages), 100% local, browser extension |
| **Personal** | $69/year or $149 lifetime | AI suggestions, tone detection, rewrites, desktop apps |
| **Professional** | $119/year | Custom style rules, API access, priority support |
| **Team** | $12/seat/month | Admin dashboard, shared dictionaries, usage analytics |
| **Enterprise** | Custom | Self-hosted, SLA, custom LLM fine-tuning |

---

## Success Metrics by Phase

| Phase | Primary Metric | Target |
|-------|---------------|--------|
| Phase 1 | Chrome installs | 1,000+ |
| Phase 2 | Cross-platform DAU | 5,000+ |
| Phase 3 | Paid conversions | 500+ |
| Phase 4 | Enterprise contracts | 10+ |

---

**Document Maintainer:** Project Lead
**Review Cycle:** Monthly
**Next Review:** February 2026
