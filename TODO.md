# Global TODO List

> **For Claude:** Read only the "Active Tasks" section. Skip "Completed Tasks" unless specifically asked.

---

## Active Tasks

### BLOCKING - Must Fix First

- [ ] **Enable BIOS virtualization for WSL2** - Required for WSL2, Docker, and full dev environment
  - Context: WSL2 install failed because "Virtual Machine Platform" requires virtualization enabled in BIOS
  - Added: 2026-01-24
  - Priority: **CRITICAL BLOCKER**
  - Steps: 1) Reboot, enter BIOS (F2/Del/F12), 2) Find virtualization (Intel VT-x or AMD-V), 3) Enable, 4) Save and reboot, 5) Run `wsl --install`
  - Blocks: WSL2, Docker, SSH from Mac, many dev tools

---

### HIGH PRIORITY - Remote Access (Control Windows from Mac)

- [ ] **Sign into Tailscale on BOTH machines** - Same account for mesh networking
  - Context: Tailscale is installed on both Mac and Windows but neither is signed in.
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps:
    - Mac: Open Tailscale app, sign in
    - Windows: Open Tailscale app, sign in with SAME account
    - Note both hostnames/IPs

- [ ] **Enable SSH on Mac** - For terminal access from Windows
  - Context: SSH server not enabled on Mac. Needs Full Disk Access for Terminal first.
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: 1) System Settings > Privacy & Security > Full Disk Access > Toggle ON for Terminal, 2) Run `sudo systemsetup -setremotelogin on`

- [ ] **Enable Screen Sharing on Mac** - For VNC access from Windows
  - Context: Allows full desktop control via VNC
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: System Settings > General > Sharing > Screen Sharing → ON

- [ ] **Configure RustDesk for remote desktop** - Alternative to Chrome Remote Desktop
  - Context: RustDesk is installed but not configured. Provides remote desktop access.
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: 1) Open RustDesk, 2) Note the ID, 3) Set permanent password in settings, 4) Share ID with Mac

- [ ] **Install Chrome Remote Desktop** - Browser-based remote access
  - Context: Not installed yet. Provides reliable remote desktop through Chrome.
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: 1) Open Chrome, 2) Go to remotedesktop.google.com/access, 3) Install extension + host, 4) Set name and PIN

- [ ] **Set up SSH access from Mac (requires WSL)** - Command-line remote access
  - Context: Need WSL2 first. Then install SSH server on port 2222, configure firewall.
  - Added: 2026-01-24
  - Priority: HIGH (blocked by WSL2)
  - Blocks: Full remote dev workflow from Mac

---

### HIGH PRIORITY - OBS Security Camera Recording

- [ ] **Install OBS Studio on Windows** - For garage security camera recording
  - Context: User wants to use Windows PC for security camera recording in garage
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: 1) winget install OBSProject.OBSStudio, 2) Configure camera sources

- [ ] **Create Windows OBS automation scripts** - AutoHotkey/PowerShell for OBS control
  - Context: Port obs-tutorial-recorder concepts to Windows. Start/stop recording, file organization.
  - Added: 2026-01-24
  - Priority: HIGH
  - Requirements: OBS WebSocket plugin, AutoHotkey scripts for control

- [ ] **Configure OBS for continuous/scheduled recording** - Security camera use case
  - Context: Different from tutorial recording - need continuous or motion-triggered recording
  - Added: 2026-01-24
  - Priority: HIGH
  - Consider: OBS auto-start, recording schedules, disk space management

---

### MEDIUM PRIORITY - App Windows Ports

- [ ] **Create Windows launcher for gmail-organizer** - PowerShell script to launch the app
  - Context: Existing launcher is bash/macOS only (`scripts/launch_gmail_organizer.sh`). Need Windows equivalent.
  - Added: 2026-01-24
  - Priority: Medium
  - Requirements: Python environment setup, .env file, client_secret.json

- [ ] **Port dev-environment-setup scripts to work on Windows** - Ensure all scripts work
  - Context: Some scripts are bash-only. Need PowerShell equivalents or WSL compatibility.
  - Added: 2026-01-24
  - Priority: Medium

---

### MEDIUM PRIORITY - Testing & Verification

- [ ] **Test DictationHistory workflow** - Verify Ctrl+Shift+S saves selected text
  - Context: Dictation capture was rewritten. Need to confirm select-then-save workflow works.
  - Added: 2026-01-24
  - Priority: Medium
  - Test: 1) Dictate with Voice Typing, 2) Select text, 3) Ctrl+Shift+S, 4) Ctrl+Shift+A to view

- [ ] **Test all hotkeys work correctly** - Full hotkey verification
  - Context: Multiple hotkeys created, need to verify all work
  - Added: 2026-01-24
  - Priority: Medium
  - Hotkeys: Double-tap Ctrl, Ctrl+Shift+S, Ctrl+Shift+A, Ctrl+Shift+D, Win+F5

---

### NEW PROJECT - WriteForge (AI Writing Assistant)

- [ ] **WriteForge MVP Development** - Privacy-first AI writing assistant
  - Context: Local-first Grammarly alternative. 100% on-device processing, no cloud dependency.
  - Added: 2026-01-25
  - Priority: Medium (new project, not blocking other work)
  - Location: `~/Desktop/Projects/writeforge/`
  - Status: **Project scaffolding complete**, ready for Phase 1 development
  - Phase 1 Features:
    - [ ] F1.1 LanguageTool Integration (grammar checking)
    - [ ] F1.2 Chrome Extension Core
    - [ ] F1.3 macOS Desktop App
    - [ ] F1.4 Local LLM Integration (Qwen2.5)
    - [ ] F1.5 Personal Dictionary
  - Documentation: `docs/ROADMAP.md`, SDDs in `docs/sdd/phase-1/`
  - Agent Prompt: `_@agent-prompts/writeforge/AGENT_PROMPT.md`

---

### LOW PRIORITY

- [ ] **Decide on Windows username change** - Options: display name only, new user, or skip
  - Context: Windows username is "danie" but user prefers "daniel". Cosmetic issue only.
  - Added: 2026-01-24
  - Priority: Low

- [ ] **Pull Ollama models on Windows** - Download models for local inference
  - Context: Ollama is installed but no models downloaded. RTX 2070 can run 7B-14B models well.
  - Added: 2026-01-24
  - Priority: Low
  - Suggested: `ollama pull qwen2.5-coder:7b` (Windows GPU is smaller than Mac)

---

## Completed Tasks

- [x] **Pull qwen2.5-coder:32b on Mac** - Coding-optimized Ollama model
  - Completed: 2026-01-24
  - 19GB model for local Claude Code usage

- [x] **Update Mac CLAUDE.md with workflow rules** - Added multi-environment section
  - Completed: 2026-01-24
  - Now matches Windows workflow (pull from main, use PRs, check agent-sync/global-todo)

- [x] **Update vscode-extensions.txt** - Full list of Mac VS Code extensions
  - Completed: 2026-01-24
  - Pushed to dev-environment-setup repo

- [x] **Clone global-todo and agent-sync on Mac** - Cross-machine repos
  - Completed: 2026-01-24

- [x] **Update agent-sync with Mac status** - Answered Windows agent questions
  - Completed: 2026-01-24

- [x] **Update CLAUDE.md with multi-environment workflow rules** - Added git workflow, hotkey creation guidelines
  - Completed: 2026-01-24

- [x] **Push Hotkeys repo to GitHub** - Created private repo and pushed
  - Completed: 2026-01-24

- [x] **Pull latest from all repos** - Synced agent-prompts, dev-environment-setup, gmail-organizer, obs-tutorial-recorder, Hotkeys
  - Completed: 2026-01-24

- [x] **Audit repos for Windows compatibility** - Documented which repos need Windows adaptations
  - Completed: 2026-01-24
  - Results: agent-prompts (ok), dev-environment-setup (ok), gmail-organizer (needs launcher), obs-tutorial-recorder (needs full port)

- [x] **Create Global TODO system** - Set up synced git repo for cross-machine task tracking
  - Completed: 2026-01-24

- [x] **Create DictationHistory.ahk** - AutoHotkey script with Ctrl+Shift+S to save selected text
  - Completed: 2026-01-24

- [x] **Add HotReload.ahk** - Auto-reload scripts when files change
  - Completed: 2026-01-24

- [x] **Add scripts to Windows Startup** - Both AHK scripts run at login
  - Completed: 2026-01-24

- [x] **Run Windows dev environment setup (partial)** - Installed tools, WSL2 pending
  - Completed: 2026-01-24
  - Installed: Docker Desktop, Tailscale, Cursor, Ollama, RustDesk, VS Code extensions, PowerShell 7
  - Pending: WSL2 (needs BIOS virtualization)

- [x] **Fix Claude CLI PATH** - Added C:\Users\danie\.local\bin to user PATH
  - Completed: 2026-01-24

- [x] **Create agent-sync repo** - Cross-machine agent communication system
  - Completed: 2026-01-24

---

## Archive

Tasks older than 30 days can be moved here.
