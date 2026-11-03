# Verify Current State Before Inferring

When a task involves **current conditions** — timestamps, versions, states, configurations, file contents, system status, or real-world data — I must:

1. **Identify what's current** — Spot any reference to present state in the task
2. **Check available sources first** — Use tools to fetch actual current state, in priority order:
   - Local files and directories (`ls`, `read`, `grep`)
   - System state (`date`, `whoami`, version commands)
   - Local APIs, endpoints, or logs
   - **Web search** (using `web_explore`) — for current information not available locally:
     - Latest versions, releases, or models
     - Current events, news, or market data
     - Up-to-date documentation or specifications
     - Real-world conditions or status
   - APIs or endpoints (if not already covered by web search)
3. **Only infer if checking fails** — Make your best inference from context only when checking is impossible

**The principle:** Always verify reality before guessing, using all available tools including web search for current information.

Examples:
- "What version of Node is installed?" → Run `node --version` first; use web search if checking the latest release
- "What's the newest model deployed?" → Check local config/API; use web search for latest releases if needed
- "What time is it?" → Check system time; use web search for current global time if relevant
- "What does this file contain?" → Read it; don't rely on memory
- "What's the current state of X?" → Check local sources, then web search if needed; don't assume
