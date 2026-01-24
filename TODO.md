# Global TODO List

> **For Claude:** Read only the "Active Tasks" section. Skip "Completed Tasks" unless specifically asked.

---

## Active Tasks

- [ ] **Enable BIOS virtualization for WSL2** - Required for WSL2 and Docker
  - Context: WSL2 install failed because "Virtual Machine Platform" requires virtualization enabled in BIOS. Need to reboot into BIOS and enable Intel VT-x or AMD-V.
  - Added: 2026-01-24
  - Priority: HIGH
  - Steps: 1) Reboot, enter BIOS (usually F2/Del/F12), 2) Find virtualization setting, 3) Enable it, 4) Save and reboot, 5) Run `wsl --install`

- [ ] **Create Windows launcher for gmail-organizer** - PowerShell script to launch the app on Windows
  - Context: The existing launcher is bash/macOS only. Need Windows equivalent for cross-platform parity.
  - Added: 2026-01-24
  - Priority: Medium

- [ ] **Create Windows OBS automation scripts** - Basic OBS control via AutoHotkey/PowerShell
  - Context: obs-tutorial-recorder is macOS-only (Swift app). Need simpler Windows alternative for recording tutorials.
  - Added: 2026-01-24
  - Priority: Low

- [ ] **Decide on Windows username change** - Options: display name only, new user, or skip
  - Context: Windows username is "danie" but user prefers "daniel". Low priority cosmetic issue.
  - Added: 2026-01-24
  - Priority: Low

- [ ] **Test DictationHistory workflow** - Verify Ctrl+Shift+S saves selected text
  - Context: Dictation capture was rewritten to use select-then-save workflow. Need to confirm it works.
  - Added: 2026-01-24
  - Priority: Medium
  - Test: 1) Dictate text with Voice Typing, 2) Select the text, 3) Press Ctrl+Shift+S, 4) Press Ctrl+Shift+A to view history

---

## Completed Tasks

- [x] **Update CLAUDE.md with multi-environment workflow rules** - Added git workflow, hotkey creation guidelines
  - Completed: 2026-01-24

- [x] **Push Hotkeys repo to GitHub** - Created private repo and pushed
  - Completed: 2026-01-24

- [x] **Pull latest from all repos** - Synced agent-prompts, dev-environment-setup, gmail-organizer, obs-tutorial-recorder, Hotkeys
  - Completed: 2026-01-24

- [x] **Audit repos for Windows compatibility** - Documented which repos need Windows adaptations
  - Completed: 2026-01-24

- [x] **Create Global TODO system** - Set up synced git repo for cross-machine task tracking
  - Completed: 2026-01-24

- [x] **Create DictationHistory.ahk** - AutoHotkey script with Ctrl+Shift+S to save selected text
  - Completed: 2026-01-24
  - Note: Uses select-then-save workflow because Voice Typing bypasses keyboard hooks

- [x] **Add HotReload.ahk** - Auto-reload scripts when files change
  - Completed: 2026-01-24
  - Hotkey: Win+F5 for manual reload

- [x] **Add DictationHistory.ahk to Windows Startup** - Created shortcut in Startup folder
  - Completed: 2026-01-24

- [x] **Run Windows dev environment setup (partial)** - Installed tools, WSL2 pending
  - Completed: 2026-01-24
  - Installed: Docker Desktop, Tailscale, Cursor, Ollama, RustDesk, VS Code extensions
  - Pending: WSL2 (needs BIOS virtualization)

- [x] **Fix Claude CLI PATH** - Added C:\Users\danie\.local\bin to user PATH
  - Completed: 2026-01-24
  - Note: Requires new PowerShell window to take effect

- [x] **Create agent-sync repo** - Cross-machine agent communication system
  - Completed: 2026-01-24
  - GitHub: https://github.com/dmhernandez2525/agent-sync
  - Files: CONTEXT.md, QUESTIONS.md, CONVERSATION.md

---

## Archive

Tasks older than 30 days can be moved here to keep the Completed section manageable.
