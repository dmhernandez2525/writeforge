# WriteForge Documentation

## Overview

WriteForge is a local-first AI writing assistant that runs 100% on your device. Professional grammar checking, AI-powered suggestions, and tone detection - without sending a single keystroke to the cloud.

## Documentation Structure

```
docs/
├── INDEX.md                    # This file
├── ARCHITECTURE.md             # System architecture overview
├── CODING_STANDARDS.md         # Code style and quality requirements
├── FEATURE_BACKLOG.md          # All features by priority
├── ROADMAP.md                  # Phase-by-phase implementation plan
└── sdd/                        # Software Design Documents
    ├── phase-1/                # MVP features
    │   ├── F1.1-languagetool-integration.md
    │   ├── F1.2-chrome-extension-core.md
    │   ├── F1.3-macos-desktop-core.md
    │   ├── F1.4-local-llm-integration.md
    │   └── F1.5-personal-dictionary.md
    ├── phase-2/                # Competitive parity
    ├── phase-3/                # Differentiation
    └── phase-4/                # Scale
```

## Quick Links

### For Developers
- [Coding Standards](./CODING_STANDARDS.md) - Required reading before contributing
- [Architecture](./ARCHITECTURE.md) - System design and component overview
- [Feature Backlog](./FEATURE_BACKLOG.md) - What to build and when

### For Project Management
- [Roadmap](./ROADMAP.md) - Timeline and milestones
- [Work Status](../roadmap/WORK_STATUS.md) - Current progress

### Feature Documentation
- [Phase 1 SDDs](./sdd/phase-1/) - MVP feature specifications

## Core Principles

1. **Privacy First** - All processing happens locally. Zero data transmission.
2. **Offline Capable** - Full functionality without internet.
3. **Open Source Core** - Transparency and auditability.
4. **Cross-Platform** - Browser, desktop (Mac/Windows/Linux), mobile.
5. **Performance** - <100ms suggestion latency target.

## Target Users

1. Security-conscious professionals (lawyers, healthcare, finance)
2. Enterprise IT teams seeking self-hosted alternatives
3. Developers who value privacy and open source
4. Linux users (completely unserved by competitors)
5. Non-native English speakers needing multilingual support

## Competitive Positioning

> "WriteForge is the first AI writing assistant that runs 100% on your device. Professional grammar checking, AI-powered suggestions, and tone detection - without sending a single keystroke to the cloud."

**Key Differentiators:**
- 100% local processing (vs. Grammarly's cloud dependency)
- Linux desktop support (vs. zero competitor coverage)
- Self-hostable for enterprise (vs. Grammarly's SaaS-only model)
- BYOK for enhanced AI (vs. locked-in cloud AI)
- Lifetime purchase option (vs. subscription-only pricing)
