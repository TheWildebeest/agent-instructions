# Maintain Agent Instructions

When creating or updating agent instructions:

1. **Write to the relevant instruction file** at `~/.agents/instructions/`
   - Use clear, descriptive filenames in kebab-case (e.g., `verify-current-state.md`)
   - One instruction per file
   - Structure: Clear title, concise explanation, numbered steps or sections, practical examples

2. **For new instructions**, also update `INDEX.md`
   - Add a link to the instruction file in the Instructions list
   - Format: `- [Instruction Title](./filename.md)`

3. **Update the harness copy** if applicable
   - After saving to `~/.agents/instructions/`, also update the corresponding entry in the harness file (e.g., `/Users/davidwildman/.pi/agent/AGENTS.md`) to keep them in sync

4. **Keep instructions focused**
   - Each file should contain one cohesive instruction or set of related guidance
   - Link to other instructions if cross-reference is needed

Example workflow:
- Create new instruction: `~/.agents/instructions/my-new-instruction.md`
- Add to INDEX.md: `- [My New Instruction](./my-new-instruction.md)`
- Update harness file if it includes agent instructions
