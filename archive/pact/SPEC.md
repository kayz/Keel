# PACT scope and acceptance

Status: current instruction-and-template implementation scope.

## Outcome

A team can use different agents while sharing discoverable, versioned project
agreements: intended outcomes, architecture, acceptance, and development/release
boundaries. PACT is the document console and establishes or changes agreements;
VERIFY designs acceptance assets and verifies delivered environments; OPAID
produces locally tested candidates; CICD delivers explicitly authorized versions
and consumes verification evidence before promotion.

The installable source is `skills/pact/`. Its instructions and resources must work
after copying that folder alone. This document describes the toolkit itself, not
the business specification of an adopting project.

## Implemented scope

- A bounded skill for new-project setup, existing-project diagnosis/adoption,
  material agreement changes, and reviewed upgrades.
- A project baseline covering authoritative documents, module/state ownership,
  finite delivery scope, user-visible verification, and executable checks.
- Selectable guidance for numerical correctness, asynchronous work, local data,
  and release contracts; no universal financial or container topology.
- Portable agent entry and outcome templates that map existing documents rather
  than creating duplicate authorities, with explicit handoffs to VERIFY, OPAID
  and CICD.
- A shared document protocol separating agreements, acceptance scenarios and
  observed evidence. The existing specification/task is the human console; no
  separate UI or duplicate task ledger is created.
- Provider-neutral responsibilities with project-selected source control, review,
  test, build and release tools; optional host metadata remains an adapter.

These are agent-executed workflows. A deterministic CLI, manifest schema,
automatic installer/upgrader, plugin packaging, and a runtime orchestration
service are outside this implementation. Do not advertise commands or automated
checks that have not been implemented.

## Invariants

1. The adopting project owns product and architecture decisions. Preserve its
   accepted choices and existing authorization; unresolved semantic conflicts
   block only dependent work.
2. Each fact has an owning document or executable contract. AGENTS is a concise
   entry; skills teach workflows; neither duplicates the entire specification.
3. A default is a starting choice for a new/unsettled project, not a reason to
   migrate an accepted architecture. Module and deployment boundaries differ.
4. Each delivered business capability has a real operation or observation path
   and finite acceptance scenarios. Internal functions are covered by owning
   capabilities. A CLI/library can use its native interface; a GUI project needs
   the agreed human-facing flow. No page-per-function requirement.
5. Machine checks, integration/runtime evidence, and explicit human acceptance
   are distinct. Missing or stale evidence remains visible.
6. Adoption does not introduce another scheduler, approval state machine or
   status ledger. Selection and source-version metadata are configuration only.
7. Skills guide behavior; project checks and review enforce what can be enforced.
   No prompt claims to override host permissions or prove semantic correctness.

## Acceptance of this edition

- Each skill has a distinct trigger, bounded output, and clear handoff; routine
  OPAID work can proceed without a PACT initialization ceremony.
- PACT can be copied on its own with all internal reference links intact.
- All four skills locate the project's same document convention through its
  working entry, preserve scenario identities and scoped historical evidence,
  and distinguish automated verification from explicit human acceptance.
- A new-project example produces a short entry, a finite outcome and relevant
  checks without inventing a service topology or mandatory release system.
- Existing-project adoption preserves authoritative sources and local rules;
  missing private authority is reported, not replaced by a stale copy.
- An extra idea discovered during implementation does not silently expand the
  accepted iteration. A legitimate authorized change remains possible.
- Local success never becomes a fabricated human approval or deployment result.
- Release scenarios distinguish new candidates from historical retry/rollback
  and preserve immutable identity under the chosen release contract.
- A local or non-Git/non-GitHub project can use the document protocol and an
  authorized release without inventing a hosted repository, tag or remote CI.

Validate frontmatter, metadata and self-contained links mechanically. Evaluate
workflow decisions with independent realistic scenarios. Such scenario checks
do not certify actual Codex/Cursor/DeepSeek host loading or a live release; those
need separate evidence when adoption includes those environments.
