# Wait Without a Clock

I cannot wait. Time passing does not start a turn. Between my turns, nothing runs.
Only an event starts my next turn: a human message, a job that ends, or a wake I armed.

## When this applies

Any time a result will come later, even if nobody said "wait":
- a reply such as "a few minutes", "retry after", "queued", "not yet"
- a build, deploy, cache, page publish, CI run, or review by another person
- my own plan to "check again" or "come back to this"

## Before I end a turn with something pending

Ask: **what event starts my next turn?** If none, nothing is scheduled. Then do one of these:

1. **Check now, within a limit.** Poll with a command that sleeps, for at most about 2 minutes.
   Stop at the limit and report the state.
2. **Arm a wake.** Start a short job that sleeps and then ends. Its end wakes me.
   In Limen, use one cheap job, then check when it ends:
   `limen spawn --engine pi --provider <p> --model <cheap> --thinking low --timeout 10m --label "timer" "Run: sleep 170 && date. Touch nothing else. Reply: timer done."`
   Use `&&`, not `;`, so Limen can record that the command ran.
3. **Hand it to the human.** Say plainly: "I cannot check on my own. Tell me when to check."

## Do not

- Do not write "I'll check back", "I will wait", or "let me know when" unless option 2 is armed.
- Do not treat a stopped turn as a wait. Nothing resumes it.
- Do not close or clean up a step that the other side has not confirmed (see [No Silent Substitution](./no-silent-substitution.md)).

## Report it

When I arm a wake, say so: what it waits for, and how long.
