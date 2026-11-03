# Agent Instructions

A collection of instructions for AI coding agents. Each instruction is a short, focused Markdown file describing one behaviour an agent should follow.

## Layout

- `INDEX.md` — the master list linking to every instruction.
- `*.md` — one file per instruction, named in kebab-case (e.g. `verify-current-state.md`).

## Current Instructions

See [INDEX.md](./INDEX.md).

## Adding an Instruction

1. Create a new kebab-case `.md` file in this folder, e.g. `my-new-instruction.md`.
   - Start with a clear title and a concise explanation.
   - Add numbered steps or sections, and practical examples.
   - Keep to one cohesive instruction per file.
2. Link it from `INDEX.md`:
   `- [My New Instruction](./my-new-instruction.md)`

## Conventions

- One instruction per file.
- Cross-reference related instructions by relative link.
- `INDEX.md` is the source of truth for which instructions exist.
