---
name: opaid
description: Implement bounded software changes under shared project contracts, with unit tests, applicable local integration, and exact candidate evidence. Use for implementation and source fixes; route contract changes to PACT, acceptance assets and environment verification to VERIFY, and authorized delivery to CICD.
---

# OPAID

## Outcome

Deliver one bounded implementation within the project's current agreements.
Verify the exact final candidate with unit and applicable local integration tests,
including locally runnable acceptance paths, and hand off traceable evidence.
Optimize for completed, reviewable outcomes and low coordination cost.

Work directly by default. Use the existing task, repository brief, and available
collaboration tools; do not create parallel registries, mailboxes, status ledgers,
or governance documents. Maintain one brief only when the project or user
requires it. These instructions apply across agents and harnesses.

## Boundary

OPAID owns task framing, implementation, source repairs, unit tests, applicable
local integration, and candidate handoff. Local dependencies, containers, services,
and browser tools needed for those checks are in scope when authorized. CICD owns
authorized build/delivery, environment technical readiness, promotion, and rollback.
VERIFY designs acceptance assets early and owns business verification after each
environment delivery. OPAID may execute those scenarios locally; local test results
do not replace a target-environment VERIFY conclusion or Human acceptance.

PACT maintains shared document contracts, including authorized design changes.
Find effective specification, architecture, scenarios, and evidence through the
project's AGENTS.md or existing entry. Follow those pointers and versions; do not
assume a sibling PACT directory or installed skill. Use existing agreements;
ordinary implementation does not require PACT initialization or a stage approval.
If an agreement must change, apply the PACT responsibility in the same task when
available. Use VERIFY's applicable stable scenario IDs and acceptance basis.
Missing scenario assets go to VERIFY; missing or conflicting product/interface
meaning goes to PACT's agreement responsibility before dependent work.
These skill names route responsibilities, not tool-specific commands or mandatory
extra sessions. When a skill is absent, use the project's documented equivalent
or report the gap; do not invent its rules or pretend it was loaded.

Respect existing user authorization. Ask only for an unresolved decision that
materially changes the result or exceeds that authorization; do not ask again for
an already authorized action.

## Task Contract

Before editing, establish the finite user result, relevant scenarios, and non-goals
from the request and repository context. State material assumptions briefly in
the existing task or brief. Identify applicable specification and architecture
revisions, applicable stable scenario IDs, affected modules, public contracts,
and local test entrypoints. Do not create a new scenario for every internal helper
or add missing process documents for a routine change. Acceptance assets describe
expected behavior before implementation; do not derive them from whatever the
implementation happens to do.

Prefer existing capabilities, module interfaces, and the authoritative state
owner. New behavior does not automatically require a new module or microservice.
Do not bypass boundaries, add a competing source of truth, or expand scope with
extra requirements discovered while coding; record those separately when useful.

Changing an architectural principle, public contract, state owner, or the meaning
of acceptance needs an explicit basis in the authorized request or a recorded
project decision. When it is missing, pause only the dependent work, describe the
decision and impact, and continue independent work. Approved changes update the
authoritative agreement and VERIFY assets through their owners, then affected
local checks; do not weaken a test to accommodate an implementation error.

## Execution Mode

Work directly when there is one implementation track, write scopes overlap,
semantics are unsettled, or dispatch and integration are unlikely to save work.

Use Workers only when at least two ready tracks have agreed inputs, disjoint write
ownership, explicit completion checks, and expected savings greater than their
coordination cost. Each Worker produces code, a bounded diagnosis, or test evidence;
do not create generic role or ceremony Agents. When the harness lacks delegation,
execute the same contract directly without introducing a substitute control plane.

When Workers are justified, read
[references/parallel-workers.md](references/parallel-workers.md). Otherwise, do
not load that reference.

## Verification and Recovery

- Select unit, contract, and applicable local integration checks by changed rules,
  interfaces, and dependencies. Run affected VERIFY scenarios and key browser or
  other user-entry paths locally when feasible; do not defer locally discoverable
  business defects until deployment. VERIFY owns the acceptance basis and
  environment conclusion, not exclusive execution of tests. Keep most cases at
  the cheapest meaningful layer; avoid tests that mirror implementation wording.
- Implement and exercise the agreed real action or observation entrypoints,
  following the project's visual requirements. Internal utilities do not each
  need a page. Mock responses, screenshots, and successful builds alone cannot
  prove a real business path. Include meaningful failure, persistence, and
  authorization tests when affected. Use reproducible fixtures and independent
  expectations for numerical or domain rules; do not copy implementation output
  into expected results or change VERIFY's frozen tolerances to make tests pass.
- During implementation, run focused checks when useful; each modifying Worker
  verifies its track. After the final edit or integration, inspect workspace status
  and diff, then run the required final local checks on that exact candidate.
  Use the project's VCS or reproducible snapshot mechanism to identify it. An
  existing revision plus the full change set, including new files, can identify a
  local candidate; do not require Git or create a commit merely to manufacture an ID.
- Write implementation and local-check facts to existing shared evidence locations,
  linking applicable stable scenario IDs, spec revision, exact candidate, and test
  environment. Preserve historical evidence and distinguish local tests, CICD
  readiness, VERIFY conclusions, and Human acceptance. Commands and exit status
  establish test facts; they cannot change scenario meaning or sign acceptance.
  Unrun checks remain unverified, and an older candidate's pass is not a new pass.
- Preserve compatible passing work. Repair bounded mechanical failures in place
  and rerun affected tests. Do not restart unrelated work, overwrite user changes,
  weaken tests or acceptance, or manufacture a pass.

## Exit

Finish local implementation when the agreed local acceptance conditions are met,
the candidate is inspected, required local checks pass, and no in-scope error
remains. If a required check cannot run or pass, report the blocking evidence and
do not label the candidate verified. Pending Human acceptance remains pending;
providing the candidate for review does not imply the Human has accepted it.

Return the bounded result and changed files, candidate and spec identities,
relevant scenario IDs, actual local check commands/results, runnable verification
entrypoints, and material limitations. Provide the inputs needed by CICD and
VERIFY; reuse shared documents rather than creating another ledger. Handoff does
not authorize delivery. If the full chain was already requested, continue within
that authorization: CICD delivers and establishes technical readiness, VERIFY
records business results for that environment, then CICD applies the promotion
or rollback contract. Required Human judgment remains explicit.
