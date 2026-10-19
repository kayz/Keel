---
name: proqaid
description: Coordinate iterations in projects that already use PROQAID or explicitly request adopting it. Use within that selected workflow for bootstrap, recovery, material scope changes, parallel role work, test-environment validation, or closure.
---

# PROQAID

## Applicability

Use this workflow only when the project already selects PROQAID or the user
explicitly requests its adoption. Other projects continue their selected workflow;
parallel development alone does not select PROQAID. Do not layer its checklist,
roles or approval states over PACT/VERIFY/OPAID/CICD. An authorized migration
selects the replacement responsibilities and preserves useful decisions/evidence.

## Purpose

Accelerate governed delivery by running independent role and implementation work
concurrently while keeping one Root Orchestrator as the semantic authority. Roles
are stable responsibility profiles, Agent instances are temporary, the
orchestration tool owns operational state, and deterministic evidence proves
results.

Do not reload PROQAID for ordinary implementation or test execution inside an
unchanged `ACTIVE` checklist. Follow the existing checklist and runner directly.

## Entry Mode

Choose the narrowest applicable mode:

| Mode | Use |
|---|---|
| `BOOTSTRAP` | establish a new governed iteration |
| `RECOVER` | restore a stalled or contradictory iteration |
| `CHANGE` | revise material scope, authority, acceptance, environment, or risk |
| `CLOSE` | judge exit gates and close the iteration |

Read only the current checklist section and affected durable decisions. Do not
replay completed entry work, reload raw history, or recreate accepted design.

## Operating Level

Use one level selected by the human and recorded in the checklist:

- **Lite**: a fast prototype or feasibility loop. It produces prototype evidence,
  not production-release assurance.
- **Governed**: the normal formal iteration. It keeps complete applicable exit
  integrity without the former Full ceremony.

There is no Full level. Add a targeted risk overlay for numerical, security,
FFI/memory, transaction/recovery, migration, or another named high-risk boundary
instead of escalating the whole iteration. Read `references/operating-levels.md`
only when choosing or changing the level or overlay.

## Seven Roles

Roles do not imply standing Agents. Instantiate only affected roles and keep every
Role Agent as a direct child of the Root Orchestrator:

| Role | Authority | Agent use |
|---|---|---|
| Orchestrator | scope, routing, decisions, integration, closure | always the root model |
| Product | user value, concepts, claims | parallel Role Agent when affected |
| Architecture | modules, data, dependencies, contracts | parallel Role Agent when affected |
| Interface | UI, API, CLI flows and states | parallel Role Agent when affected |
| Delivery | test environment, candidate deployment, release and runtime operations | parallel Role Agent when affected |
| Quality | testing of a delivered candidate in the ready test environment | post-Delivery Role Agent |
| Review | quality of the final document set | final document-only Role Agent |

Run affected Product, Architecture, Interface, and Delivery analysis concurrently
when their boundaries can be judged independently. They may exchange facts,
questions, proposals, and dependency notices directly through the orchestration
tool. They do not approve one another. Only the Orchestrator resolves cross-role
conflicts and freezes a decision.

Do not invoke Quality during design, contract freeze, implementation, local
self-test, candidate integration, environment construction, deployment, release,
or Worker review. Invoke it only after Delivery reports that the exact candidate is
healthy in the named test environment. Quality executes the applicable test
inventory there, reports actual results and defects, and stops. The Orchestrator
routes fixes; Delivery redeploys the repaired candidate before Quality retests.

Invoke Review only when a final document set exists. Give it only those final
documents. Review checks their completeness, structure, clarity, internal
consistency, and executable instructions. It does not read code, diffs, tests,
evidence, logs, prompts, Agent messages, or operational history; it does not judge
software behavior or Agent behavior. Skip Review when there is no final document
deliverable.

## Authoritative Checklist

Keep one `iteration-N-checklist.md` as the current state and evidence index:

```text
DRAFT -> AWAITING_USER_CONFIRMATION -> ACTIVE -> CLOSED
```

Keep it concise:

- outcome, acceptance sentence, non-goals, level, and risk overlays;
- affected roles and durable frozen boundaries;
- durable task dependencies and the orchestration run reference;
- phase-specific prerequisites and blockers;
- latest candidate, gate status, compact evidence links, and accepted risks;
- one current summary per phase rather than an append-only attempt diary.

Do not copy active Agent status, message traffic, queue state, timeouts, or retries
from the orchestration tool into the checklist. Store raw commands, logs, reports,
traces, and retry history in the execution system. Request renewed confirmation
only for a material scope, authority, irreversible action, acceptance, environment,
exit, or risk-acceptance change.

## Orchestration Tool and Parallel Agents

Use the orchestration tool as the sole authority for Agent identity, parentage,
available slots, spawn, messaging, follow-up, wait, interruption, completion,
timeout, and cleanup. The checklist owns semantic decisions; the runner owns
commands and evidence. Do not create a second Agent registry, mailbox, or status
ledger in Markdown or ad hoc files.

Use one scheduling layer. Only the Root Orchestrator creates Agent instances. Role
Agents, Development Workers, and Test Agents are direct siblings; they may message
one another but must not create descendants. A coordinator or workstream lead may
coordinate siblings through messages while the Root retains lifecycle control.

Fill available slots with the highest-value ready tasks when all of these are true:

- the task has a frozen input and bounded result;
- it is read-only or has a disjoint write scope;
- it does not depend on an unfinished task in the same wave;
- it has an independent self-test or deterministic completion check;
- expected speedup exceeds dispatch and integration cost.

Use the main model directly or schedule sequentially when these conditions do not
hold. If Agent-management or messaging capabilities are unavailable, preserve the
same role contracts in a single-agent fallback; do not emulate an Agent manager
with filesystem mailboxes.

Messages may exchange facts, questions, local proposals, evidence references, and
blockers. A message cannot change scope, acceptance, a public contract, risk
acceptance, or candidate identity. Escalate such proposals to the Orchestrator.
Bound peer exchanges by the task contract; unresolved coordination returns to the
Orchestrator instead of becoming an open-ended Agent discussion.

When an Agent exceeds its timeout or interaction budget, let the orchestration
tool interrupt and clean up that attempt. Continue with completed independent
results when they are sufficient; otherwise requeue only the missing bounded role
or task. Do not wait indefinitely, restart the whole wave, or grant descendant-
spawn authority as a recovery shortcut.

## Orchestration Telemetry Overlay

Enable orchestration telemetry only when recovering a stalled iteration,
investigating execution efficiency, or coordinating enough Workers that routing
and recovery behavior need observation. Keep it off for routine small tasks.

Prefer telemetry emitted by the orchestration tool. If it has no durable event
export, use one stable adapter-owned append-only JSONL logger under
`.agents/logs/{iteration}-orchestration-events.jsonl`. Record boundary events, not
reasoning transcripts: Role Agent or Worker start, report, escalation, direct
message metadata, completion, candidate integration, and cleanup failure.

Telemetry is operational evidence, never checklist state, acceptance evidence, a
Worker result, or a role verdict. Do not read or replay it during execution unless
the human requests analysis or a declared diagnostic window is active. Do not let
logging failure block delivery. Correlate it with durable evidence by iteration,
task, attempt, Worker, base, and candidate identifiers rather than copying prompts,
diffs, test data, credentials, or raw test output into the log.

Observe flow efficiency, Worker effectiveness, verification quality, scope and
boundary drift, runner/environment health, and integration/cleanup. Add model and
resource or Delivery/SIT/UAT windows only when those phases are active. Read
`references/orchestration-telemetry.md` when enabling telemetry, defining its
schema, or analyzing execution efficiency.

## Environment, Delivery, and Quality

Treat environment control as phase-specific capability, not a universal entry
ceremony:

- **Development**: check only capabilities required by the current task. Prefer
  compatible ranges; exact pins are justified only by output, ABI, security, or
  reproducibility needs.
- **Test environment/SIT**: enter when acceptance requires integrated services,
  persistence, deployment topology, or target-like behavior. Delivery deploys and
  proves the environment ready before Quality starts.
- **Release/UAT**: apply strict artifact, migration, rollback, credential, and
  target-environment controls after the applicable Quality test gate passes.

Use one project-selected development OS and shell for the main model and ordinary
workers. Cross operating-system execution is an explicit compatibility gate, not
a default worker path.

Delivery owns SIT and release contracts and updates shared environment baselines
when an operational boundary changes. It does not manage each worker's cache,
scratch space, ordinary tool invocation, or routine development loop. A local
missing tool belongs to the worker/runner; a broken shared runner belongs to the
Orchestrator; privileged host work belongs to the Human Operator.

Delivery reports a test-environment handoff containing the exact candidate and
artifact identities, environment identity, topology, data/fixture manifest, health
status, access method, and cleanup boundary. Quality consumes that handoff without
building, deploying, repairing, or administering the environment. Quality failures
return to the Orchestrator as defects; they never authorize Quality to direct a
Builder or weaken an expected value.

Read `references/execution-contracts.md` only when a worker contract, external
executor, SIT/release environment, or Human Operator action is being created or
changed.

## Worker Contract and Recovery

Development Workers and Quality Test Agents are temporary executors, not roles.
The Root Orchestrator creates each as a direct child. Give each executor:

- one task/checklist/case/defect ID and exact base;
- isolated workspace and allowed/excluded paths;
- frozen contracts, expected values, Oracle references, and forbidden changes;
- required self-test commands and risk-based regression commands;
- timeout, result schema, evidence fields, recovery budget, escalation, and cleanup.

Do not require ceremonial RED/GREEN evidence. A pre-change reproduction is
optional when it helps diagnose a defect. Every modifying worker must run the
specified self-test after its change. The runner, not worker prose, records actual
commands, exit codes, test inventory, counts, and evidence.

Preserve a recoverable candidate while the same worker adjusts a bounded mechanical
error. Use the checklist budget; stop and escalate when scope or frozen semantics
must change, root cause becomes cross-module or high-risk, evidence is weakened,
or the budget is exhausted. A Development Worker completion statement is only a
candidate for Orchestrator integration. A Test Agent result is only an input to the
Quality test report. Runner facts override Agent prose.

## Minimal Flow

### Bootstrap

1. State one outcome and acceptance sentence; split only genuinely independent outcomes.
2. Select Lite or Governed and any risk overlay.
3. Mark affected Product, Architecture, Interface, and Delivery roles.
4. Use the orchestration tool to run ready affected roles concurrently; let them
   interact directly within their contracts.
5. Let the Orchestrator resolve only cross-role conflicts and freeze the durable
   decision delta. Do not invoke Quality or Review.
6. Record only current-phase prerequisites, then activate the checklist.

### Active execution

Use the existing checklist and runner without re-invoking PROQAID. Workers modify,
self-test, and return structured evidence. Keep ready, disjoint work in parallel
and backfill free slots from the dependency graph. Role Agents and Workers may
coordinate directly, but the Orchestrator alone integrates candidates and freezes
changed semantics. Do not invoke Quality or Review during implementation.

### Delivery and test

Delivery deploys the exact integrated candidate to the isolated test environment
and returns the required handoff. Only then does the Orchestrator start Quality and,
when useful, sibling Test Agents for disjoint inventory partitions. Quality returns
one consolidated test report and defect list. For a defect, the Orchestrator routes
the fix, Delivery redeploys the new exact candidate, and Quality reruns the affected
inventory in the ready test environment. Release or final target mutation follows
the applicable Quality pass.

### Change or recovery

Load the current blocker and its affected boundary only. Preserve useful candidate
state, revise the smallest contract or decision, and resume from that checkpoint.

### Close

Close only when applicable acceptance, test-environment Quality, Delivery, release,
cleanup, and risk gates pass or the human explicitly accepts a documented risk.
After final documents are complete, invoke one Review with only that document set
and repair only document findings. If there is no final document deliverable, skip
Review. Record the final candidate and set the checklist to `CLOSED`.

## Common Failure Corrections

| Failure | Correction |
|---|---|
| Restarting governance on every turn | Resume from the current checklist phase |
| Keeping independent affected roles in the main thread | Start direct sibling Role Agents through the orchestration tool |
| Creating nested Agents | Keep one layer; only the Root creates Agent instances |
| Copying Agent state into the checklist | Query the orchestration tool and retain only semantic decisions |
| Defaulting every iteration to maximum ceremony | Use Governed plus targeted overlays |
| Blocking development on unused SIT/release tools | Check the capability only when its phase begins |
| Making Delivery the development-environment operator | Keep Delivery at SIT/release boundaries |
| Invoking Quality before the test environment is ready | Let Delivery hand off the deployed exact candidate first |
| Asking Quality to review implementation or direct fixes | Quality tests and reports defects; the Orchestrator routes fixes |
| Giving Review code, evidence, or Agent history | Give Review only the final document set |
| Invoking Review when no final documents exist | Skip Review |
| Requiring RED/GREEN from every worker | Require executed self-test evidence |
| Resetting a useful candidate after a small error | Preserve it within the recovery budget |
| Expanding the checklist with attempt history | Replace the phase summary and link raw evidence |
