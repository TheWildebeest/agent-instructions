# Wait Without a Clock

Nothing runs between my turns. Only an event starts my next turn: a human message, a job that ends, or a wake I armed. Time passing starts nothing.

## Before I end any turn

Is anything I need still pending? Look for output like pending, queued, in progress, building, propagating, "retry after", "a few minutes", or a review or reply from someone else. If yes, name the event that starts my next turn. If I cannot name one, none exists. Then pick:

1. **Machine wait, short (under about 2 minutes):** poll in one command that exits as soon as the result appears. At the limit, stop and report the state. Never sleep for a fixed time and hope.
2. **Machine wait, longer (the default):** arm a wake. Start a short job that sleeps and then ends. Its end starts my next turn.
   In Limen: `limen spawn --engine pi --provider <p> --model <cheap> --thinking low --timeout 10m --label "timer" "Run: sleep 170 && date. Touch nothing else. Reply: timer done."`
   Use `&&`, not `;`. Tell the human what the wake waits for and how long.
3. **Wait on a person:** a timer does not help. Say what I need and from whom: "I cannot check on my own. Tell me when <event> is done."

## Check my last message

If it says I will check, verify, retry or return later ("I'll check back", "once it finishes I will…", "let me know when"), it is a false promise unless a wake is armed. Arm one, or rewrite the ending.

Bad: "CI is running; I'll check in a few minutes."
Good: "CI is running. Timer armed for 3 min (job `timer`); I will read the CI result when it ends."

Never close or clean up a step the other side has not confirmed (see No Silent Substitution).
