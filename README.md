# Agent Instructions Auto-Sync

## How It Works

Pi syncs agent instructions on startup via the `pi-sync-instructions` package, whose source lives in `~/dev/pi-sync-instructions/` (installed with `pi install` from that path; see its README for configuration and publishing).

**When Pi loads:**
1. The extension fires on the `session_start` event (or run `/sync-instructions`)
2. It reads `INDEX.md` from the configured instructions folder (default `~/.agents/instructions`)
3. It concatenates every instruction file linked from INDEX.md
4. Output is written to `~/.pi/agent/AGENTS.md`

## Adding New Instructions

To add a new instruction that auto-syncs:

1. Create a new `.md` file in `~/.agents/instructions/`
   - Example: `~/.agents/instructions/my-new-instruction.md`

2. Add a link to it in `~/.agents/instructions/INDEX.md`
   - Format: `- [My New Instruction](./my-new-instruction.md)`

3. **No additional steps needed** — the sync will happen automatically when Pi next loads

## Files Involved

| File | Purpose |
|------|---------|
| `~/.agents/instructions/INDEX.md` | Master index of all instruction files |
| `~/dev/pi-sync-instructions/` | The `pi-sync-instructions` npm package (extension + sync logic) |
| `~/.pi/agent/AGENTS.md` | Generated output (authoritative in Pi) |

## Manual Sync

Run `/sync-instructions` inside Pi, or restart Pi.

## Troubleshooting

- If instructions don't update, check that the instruction file is properly linked in `INDEX.md`
- The extension runs silently on success; errors appear as notifications in Pi
- Check `~/.pi/instructions-sync.log` for detailed sync history
