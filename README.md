# Global TODO System

Cross-machine task tracking for AI-assisted development workflows.

---

## FOR AI AGENTS: First-Time Setup

**If this is your first time reading this repo, you MUST update your configuration file:**

### On Windows
Add to `C:\Users\danie\CLAUDE.md`:

```markdown
## CRITICAL: Global TODO System

### Location
This is a git repo that syncs between machines:
- **Repo:** `Desktop/Projects/Personal Projects/global-todo/`
- **Tasks file:** `TODO.md` in the repo

### Workflow
1. **At session start:** Pull latest and read Active Tasks
2. **During work:** Add new tasks as discovered
3. **At completion:** Mark done, move to Completed section
4. **Before ending:** Commit and push changes

### Commands
```bash
cd "Desktop/Projects/Personal Projects/global-todo"
git pull origin main
# ... work ...
git add TODO.md && git commit -m "Update tasks" && git push
```
```

### On Mac
Add to `~/.claude/CLAUDE.md` (or equivalent):

```markdown
## CRITICAL: Global TODO System

### Location
This is a git repo that syncs between machines:
- **Repo:** `~/Desktop/Projects/Personal Projects/global-todo/`
- **Tasks file:** `TODO.md` in the repo

### Workflow
1. **At session start:** Pull latest and read Active Tasks
2. **During work:** Add new tasks as discovered
3. **At completion:** Mark done, move to Completed section
4. **Before ending:** Commit and push changes
```

---

## How It Works

1. **TODO.md** contains all tasks with context
2. **Active Tasks** section: Current work (read this)
3. **Completed Tasks** section: Done items (skip this)
4. Changes sync via git between Mac and Windows
5. AI agents maintain the list during sessions

## Task Format

```markdown
- [ ] **Task Title** - Brief description
  - Context: Why this exists, what problem it solves
  - Added: YYYY-MM-DD
  - Priority: High/Medium/Low
```

## Completing Tasks

1. Change `- [ ]` to `- [x]`
2. Add `Completed: YYYY-MM-DD`
3. Move entire task block to "Completed Tasks" section
4. Commit: `git commit -m "Complete: Task Title"`

## Why This Exists

- **Multi-machine:** Work continues seamlessly between Mac and Windows
- **Session persistence:** Tasks survive even if chat history is lost
- **Side tangent management:** Add tasks instead of going down rabbit holes
- **AI context efficiency:** Completed tasks at bottom = less reading

---

## For Humans

### Quick Commands

```bash
# View current tasks
cat TODO.md | head -50

# Pull latest
git pull

# After AI session, push changes
git add TODO.md && git commit -m "Update tasks" && git push
```

### Manual Task Addition

Edit `TODO.md` directly and follow the format above.
