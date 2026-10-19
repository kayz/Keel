# OPAID Parallel Workers

Read this reference only after the execution gate in `SKILL.md` justifies Workers.

## Dispatch

- Use one coordinating agent and direct Workers; avoid nested coordination.
- Use the harness's available delegation mechanism and the smallest context that
  makes the contract self-contained. Do not require a specific provider's API,
  hidden conversation history, or another team member's personal configuration.
- Partition by independent outcomes and disjoint paths. Give a shared file one
  owner at a time. Do not fill or backfill slots merely because they are available.
- Default communication is Worker-to-coordinator. Send peer messages only for a fact that
  blocks a declared dependency; avoid status chatter.

## Worker Contract

Include only what affects execution:

- bounded user outcome, acceptance, non-goals, and allowed or excluded paths;
- common source revision and any relevant existing workspace changes;
- authoritative specification and architecture versions accessible to all members,
  found through the project's shared entry, with applicable stable VERIFY scenario
  IDs and the project's selected checks rather than personal alternatives;
- agreed behavior, interface and state ownership, including who resolves a shared
  interface change; unknown semantics go back to that owner before dependent edits;
- required targeted checks, integration assumptions, and forbidden changes.

If an agent cannot access the required contract, give it the authorized material
or pause its dependent work. Do not let it infer a replacement from an obsolete
copy. Agree a shared-file owner before concurrent edits. In separate checkouts,
exchange the actual change and candidate identity, not just a statement of success.

Require a concise return containing status, candidate/spec identity, applicable
scenario IDs, changed files, commands/exit status and test environment, plus
material blockers or residual risk. Write only implementation and local test facts;
do not alter acceptance semantics or replace historical evidence with a new pass.
Do not request copied diffs, transcripts, plans, or narrative summaries when the
workspace and command output already provide that evidence.

## Integration and Recovery

The coordinator accepts a result only after inspecting the actual diff and test
evidence against the same agreements. Resolve conflicts without discarding user
changes or quietly changing shared semantics. Separately passing tracks do not
prove that the integrated candidate passes; rerun affected unit, contract, local
integration, and locally runnable user-path checks on the exact integrated
candidate. These checks retain the shared VERIFY scenario basis; they do not
replace its target-environment business conclusion.

On timeout or bounded failure, stop concurrent writes from that attempt before
reassigning the unfinished remainder. Preserve compatible verified work, rerun
affected checks during repair, and identify the exact integrated candidate in the
handoff. Automation cannot sign the Human acceptance of that candidate.
