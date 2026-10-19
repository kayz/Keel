---
name: pact
description: Establish, inspect, or revise the project's shared document console, specifications, architecture, agent instructions, and acceptance contracts. Use for project setup, legacy adoption, understanding current delivery evidence, or material agreement changes; route implementation, acceptance verification, and release to the selected workflows.
---

# PACT

Project Architecture & Collaboration Toolkit.

## Outcome and scope

Provide the human-facing document console for the project's effective agreements
and delivery evidence: what to deliver, which boundaries hold, how to verify it,
what actually passed, and what remains. Use the existing specification/index and
current task record as the console; this edition does not build a dashboard or
runtime controller. End with a reviewable baseline, evidence summary, or bounded
diagnosis, with links to the owning sources.

PACT owns agreement meaning, the shared document protocol, and responsibility
routing. VERIFY designs acceptance assets before implementation and verifies
business outcomes after each authorized environment delivery. OPAID owns bounded
implementation, unit tests and applicable local verification. CICD owns authorized
delivery, technical readiness, promotion and rollback, consuming VERIFY evidence.
These responsibilities can occur in one task;
do not require a new session, repeated approval, or a PACT phase for every edit.
When another skill is unavailable, explain the handoff and continue authorized
work with the project's documented equivalent; do not pretend it was loaded.

Do not introduce an agent scheduler, a second iteration ledger, mandatory role
agents, or a new approval state machine. Respect the project's existing workflow.
This skill provides instructions and templates, not an installed CLI or automatic
policy enforcement.

## Choose the requested work

- **Diagnose:** read the applicable instructions, effective specs, architecture,
  current task and check entry points. Summarize the human result, real acceptance
  entry, candidate/environment evidence and next bounded work. Report concrete
  conflicts and gaps without changing files when the request is diagnostic.
- **Adopt:** for a new project establish the smallest usable baseline; for an
  existing project map and supplement its accepted documents. Apply reversible
  changes within the user's authorized scope, preserving unrelated work.
- **Revise or upgrade:** identify the affected decision, its owner, consumers and
  checks. Use existing approval and version evidence; make a reviewable change
  without silently replacing local decisions or broadening product scope.

For document setup, delivery review or cross-skill handoff, read
[document-protocol.md](references/document-protocol.md). For adoption, upgrade or cross-agent setup, read
[project-adoption.md](references/project-adoption.md). For architecture or
acceptance decisions, read [architecture-and-acceptance.md](references/architecture-and-acceptance.md).
Read only the references relevant to the task.

## Establish the minimum agreement

1. **Authority:** identify current accepted SPEC/architecture/ADR/acceptance
   sources, their applicable revisions, and who can resolve semantic changes.
   Mark drafts and superseded material. If authority is external/private, verify
   the required revision is available to the authorized worker; do not promote
   an unverified local copy. Continue independent work when a source is missing.
2. **Finite outcome:** define the user result, acceptance scenarios and non-goals
   for the current slice in its existing issue or sole brief. Keep future ideas
   separate. Exploration can produce a prototype with declared omissions; it
   does not establish production readiness.
3. **Architecture:** identify module responsibilities, public inputs/outputs and
   errors, one owner for each state/decision, permitted dependencies and assembly
   points. Reuse existing capabilities before adding modules or services.
4. **Verification:** bind the user result to a real operation/observation entry
   and finite scenarios. VERIFY turns these into test assets, independently based
   expected results, and a human walkthrough. Keep human judgment explicit.
5. **Working entry:** provide or reuse a short project entry, such as AGENTS.md
   or the host's equivalent, linking those sources and applicable check commands.
   Select project-scoped skills and applicable local rules. Keep detailed decisions
   in their owning documents; do not add a competing entry to an existing project.

Reuse existing structures. The [AGENTS template](assets/AGENTS.md.template) and
[outcome template](assets/outcome.md.template) are optional starting points, not
required additional files. Resolve their fields before treating them as active
instructions. Small fixes need only relevant task context, not a new spec.

Keep one project-owned document protocol discoverable from the working entry.
Use accepted conventions or adapt the linked protocol once; selected skills read
that same source rather than maintaining their own project specification copies.
Existing projects may map their headings and locations to the same meanings.

Separate accepted requirements from proposed additions and reversible working
defaults. An adoption request permits useful defaults; it does not make every
derived detail an approved product promise. Keep unneeded edge cases and new
guarantees outside the acceptance gate. Implementers may refine ordinary defaults
within the agreed outcome without seeking architectural approval for each choice.

## Defaults and decisions

For a new project without an accepted architecture, start with a modular core,
narrow interfaces, explicit adapters and composition. Select separate processes
or services for demonstrated isolation, scaling or lifecycle needs. Do not impose
microservices, a plugin registry, or a new module for every change. Preserve an
existing project's accepted architecture unless a change is in scope.

Business capabilities must have an agreed, discoverable real operation or
observation surface. Automated/background capabilities can be read-only views;
internal helpers are verified through their owning capability. Do not add a
dashboard or CRUD page for every function, or duplicate backend rules in a UI.

Changes to product meaning, state ownership, public compatibility or acceptance
need explicit decision authority. If already authorized, record the decision and
proceed; otherwise present the concrete conflict and ask only for the missing
decision. Routine implementation choices remain with the implementing agent.
Never rewrite expected results or weaken a boundary merely to match broken code.

## Verification and handoff

Check that referenced sources and required workflows are available, commands
exist, and changed instructions agree. Run applicable existing checks when the
task authorizes verification; distinguish executed checks from proposed ones.
Attach a meaningful dependency/contract check where the selected constraint can
be mechanically enforced. Do not claim a generic checker proves design quality.

For each relevant capability distinguish implementation, real integration,
environment-specific runtime verification, and explicit human acceptance. Use
existing evidence locations and candidate identities; absence means unverified,
not success. Static pages, mock responses and registration alone are insufficient.

Return the adopted or diagnosed scope, effective sources, selected workflows,
actual checks, remaining decisions and next bounded user path. State whether
only repository files or actual host loading was verified. Hand ordinary
implementation to OPAID, acceptance design/environment validation to VERIFY, and
authorized delivery to CICD without adding ceremony. Preserve the project's
chosen source control, issue tracker, test runner, CI and agent tools; select
platform adapters only when applicable. A tool name or file layout is not a
universal architecture requirement.
