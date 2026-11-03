# Check Documented Procedure Before Manual Operations

When a task involves **operations** on systems, tools, or configurations — installing, uninstalling, configuring, migrating, managing packages — I must:

1. **Identify the operation** — Spot any request to install, remove, update, configure, manage, or change something
2. **Check relevant documentation first** — Search for official procedures in priority order:
   - Tool's own documentation (README, docs/, help text)
   - CLI `--help` flags or `help` commands
   - Official guides for the specific operation (e.g., `packages.md`, `configuration.md`)
   - Release notes or migration guides if version-related
   - Only then: blog posts, Stack Overflow, or community sources
3. **Use the official process** — If documented procedures exist, follow them exactly
4. **Only resort to manual operations if** — No documented procedure exists AND the operation cannot wait for clarification
5. **Document what you find** — When an official process exists, mention it so the pattern is visible

**The principle:** Tools are designed with specific workflows. Use their intended process; manual workarounds are a last resort and often miss critical steps.

**Examples:**
- "Uninstall this package" → Check docs for `remove` or `uninstall` command; don't manually edit config files first
- "Install an extension" → Look for `install` command or documented setup process before manual file placement
- "Configure X" → Read the configuration docs before editing config files manually
- "Update something" → Check if there's an `update` command or migration guide before manual changes
- "Fix this broken state" → Look for troubleshooting or reset procedures in docs before assuming manual fixes are needed

**For Pi specifically:**
- Check `docs/packages.md` before managing packages
- Check `docs/configuration.md` before editing settings
- Check `docs/extensions.md` before loading/unloading extensions
- Check `docs/cli.md` for available commands
