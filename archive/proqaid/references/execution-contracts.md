# PROQAID Execution Contracts

Read this file only when creating or changing a Role Agent, worker, external
executor, Human Operator, test-environment/SIT, Quality, Review, or release contract.

## Role Agent Contract

The Root Orchestrator creates every Role Agent as a direct child through the
orchestration tool. Give it:

```text
role and task ID
frozen outcome, acceptance and affected boundary
facts and durable decisions it may read
questions and result fields it must return
named sibling Agents it may contact
proposals that require Orchestrator decision
interaction budget, timeout and cleanup
```

Product, Architecture, Interface, and Delivery Role Agents may exchange facts,
questions, proposals, and dependency notices. They do not approve one another,
spawn descendants, change scope or acceptance, integrate candidates, or create a
second operational state ledger. The orchestration tool is authoritative for their
identity, messages, lifecycle, and status.

On timeout, the Root uses the orchestration tool to interrupt and clean up the
attempt. It keeps completed sibling results and requeues only a missing result that
is necessary to freeze the affected boundary. A stalled Role Agent never receives
permission to spawn a descendant as recovery.

## Worker Contract

Use a compact core shared by Development Worker, Quality Test Agent, environment
executor, and other approved executor profiles:

```text
task/checklist/case/defect ID
executor profile, actual model, permission, OS and shell
exact base and isolated workspace
allowed and excluded paths
frozen contracts, expected/Oracle references, forbidden changes
required self-test or execution commands
risk-based regression commands
timeout and recovery budget
structured result and evidence fields
allowed peer contacts, escalation, integration and cleanup rules
```

Profile-specific requirements:

- **Development Worker**: implement the bounded change and run its self-test.
- **Quality Test Agent**: start only after Delivery reports the exact candidate
  healthy in the named test environment; execute its assigned inventory partition
  and return actual counts, defects and evidence to Quality.
- **Environment/SIT Executor**: operate only named project resources and return health,
  isolation, identity, candidate/artifact binding, handoff, and cleanup evidence.
- **Release Executor**: Delivery-only target access, artifact identity, deployment,
  health, rollback readiness, and credential isolation after the Quality gate.

A defect reproduction before modification is optional. Do not require RED/GREEN
ceremony. Required commands must actually execute; runner records override prose.

## Result

Return a compact machine-readable result containing at least:

```json
{
  "status": "ready|blocked|failed",
  "base_sha": "...",
  "candidate_sha": "...",
  "changed_files": [],
  "commands": [],
  "tests": {"expected": 0, "passed": 0, "failed": 0},
  "evidence": [],
  "recovery_cycles": 0,
  "blockers": [],
  "cleanup": "...",
  "summary": "..."
}
```

Record actual model, OS/shell, permission, command/argv, cwd, start/end or duration,
exit code, inventory/counts, evidence digest/location, and escalation reason where
applicable. Agent prose cannot change deterministic facts or supply an Orchestrator,
Quality, or Review verdict.

## Quality Test Contract

Start Quality only from a Delivery handoff for an exact candidate already healthy
in the named test environment. Give Quality:

```text
candidate, artifact and environment identities
health and access handoff
frozen acceptance, expected values and Oracle references
test inventory, partitions and required commands
Root-created sibling Test Agent identities
result, defect and retest fields
timeout and cleanup boundary
```

Quality may coordinate sibling Test Agents through direct messages and consolidate
their deterministic results. It does not spawn Agents, deploy or repair the
environment, review implementation, change expected values, direct Development
Workers, decide release mechanics, or accept risk. Return defects to the
Orchestrator. A repaired candidate requires a new Delivery handoff before retest.

## Document Review Contract

Start Review only after a final document set exists. Its complete input is:

```text
final document paths or immutable document references
intended audience of each document
requested document-quality verdict
```

Review checks only completeness, structure, clarity, internal consistency, and
whether instructions inside the documents are executable as written. Do not give
it code, diffs, tests, evidence, logs, prompts, Agent messages, risk ledgers, or
operational history. It does not infer or judge software behavior or Agent behavior.
If there is no final document deliverable, do not create a Review request.

## Recovery

Keep the candidate and relevant failure evidence while the same worker performs
checklist-approved bounded correction. Stop and return to the Orchestrator when:

- a frozen boundary, expected value, Oracle, tolerance, or acceptance must change;
- the requested write scope expands;
- root cause is unknown across modules or enters a high-risk overlay;
- assertions or evidence would be weakened;
- the recovery budget is exhausted.

Environment or runner failures stay with the same execution tier. Repair the
environment or executor rather than changing models without a capability reason.

## Phase-Specific Environment Contract

### Development

- Use the project's declared primary OS and shell for the main model and workers.
- Check only tools needed by the current task.
- Prefer minimum/compatible versions; pin exactly only for a recorded output, ABI,
  security, or reproducibility reason.
- Keep worker scratch, caches, and ordinary dependency repair outside Delivery's
  per-task workflow.

### SIT

Create a SIT contract only when acceptance requires integrated persistence,
services, topology, deployment packaging, or target-like behavior. Record service
identity, data manifest, isolation namespace, health checks, acceptance commands,
access method, and cleanup. Delivery must return this handoff before Quality or any
Quality Test Agent starts. An iteration that does not need SIT has no SIT admission
work.

### Release/UAT

Delivery records artifact identity, target, configuration, migration, rollback,
health, credential handling, and release evidence. Release begins only after the
applicable test-environment Quality gate passes. Ordinary workers do not receive
release credentials.

## Human Operator

Ask the human only for privileged host actions, accounts, secrets, organization
systems, or another action outside agent authority that blocks the current phase.
Batch known actions, provide a copyable command when safe, define success evidence,
and never request secret values. Do not front-load future SIT or release setup into
development admission.

## Evidence Retention

Keep raw logs, reports, screenshots, traces, and retry history in the execution
system. Put only candidate-bound summaries and durable artifact references in the
iteration checklist. Reuse unchanged evidence until its command, dependency,
fixture, toolchain, runtime, or candidate binding changes.
