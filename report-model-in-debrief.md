# Report Model in Debrief

When submitting a debrief for a Challenge, include the model used in the `model` field.

1. **Find the model** — Check the session logs or tool call output for the `model` field. It shows the exact model ID used for the calls.
2. **Use that ID** — Pass it to the debrief call in the `model` field (≤ 80 chars).
3. **If unsure** — Leave the field out. The debrief tool accepts it or leaves it empty.

**Why:** The model matters for understanding what was possible in that solve. Use the source of truth: the tool call logs.

**Example:** A message in the logs shows `"model": "claude-sonnet-5.5"`. Pass `model: "claude-sonnet-5.5"` to the debrief.
