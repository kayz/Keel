---
name: verify
description: Design executable acceptance tests and human verification paths from accepted requirements before implementation, or verify business behavior after an authorized environment delivery. Keeps expected behavior independent of implementation; unit testing and deployment remain with their respective workflows.
---

# VERIFY

## Purpose and Boundaries

Make the accepted outcome testable before implementation, then establish whether
the delivered candidate achieves it in a named environment. Reuse the project's
tools; this skill does not require a particular framework, runtime, or agent.

PACT maintains the effective requirements, architecture, and shared documentation
conventions. VERIFY designs acceptance assets and evaluates business outcomes.
OPAID owns implementation, unit tests, and applicable local verification, including
running available acceptance tests. CICD owns build, publication, environment
delivery, technical readiness, promotion, and rollback; CI can execute VERIFY's
tests. These are responsibilities, not separate mandatory agents or approvals.
Use the corresponding skills when available, otherwise preserve the boundaries.

Read the project's effective entry point, such as `AGENTS.md`, to locate the
authoritative spec or task brief, documentation conventions, relevant contracts,
and existing test and evidence locations. Do not assume sibling skills or a fixed
project layout. A missing private authority blocks only decisions that depend on
it; do not replace it with an obsolete local copy.

## Shared Documentation Contract

Use the same authoritative feature spec or finite task brief as the other
workflows. Reuse its sections and links to existing documents, tests, and CI
reports; do not create a parallel acceptance ledger.

Keep three kinds of information distinct:

- **Agreement:** effective spec revision, bounded outcome and non-goals, public
  capability/interface commitments, and the real action or observation surface.
- **Acceptance scenarios:** stable scenario identifiers, linked requirements,
  preconditions and inputs, independent expected behavior, executable check
  entries, repeatable human steps, and applicable environments or side effects.
- **Execution evidence:** candidate and environment identity, governing spec and
  scenario revisions, inputs, expected and actual results, check/run references,
  gaps, and any explicit human acceptance record.

Each fact has one maintained home. Before continuing another agent's work, resolve
the effective agreement, exact candidate, evidence that still applies, and the
remaining scope from those existing records. A document or test change must not
quietly change the accepted outcome. Record the basis for legitimate requirement
changes or test corrections; route unresolved product or contract meaning through
PACT's responsibility, while continuing independent work.

## Choose the Work

For pre-implementation acceptance design or retrofitting an existing capability,
read [references/design-acceptance.md](references/design-acceptance.md). Produce
scenarios, fixtures, executable tests where the agreed interface permits them,
and human verification steps. Limit work to the current accepted outcome, not
speculative future modules or internal implementation details.

After each authorized environment delivery, read
[references/environment-verification.md](references/environment-verification.md).
Verify through the delivered system's real interfaces and user surfaces. A test
deployment can be followed by VERIFY, then an authorized production promotion and
another VERIFY pass. Do not postpone all useful tests until production delivery.

Design and execution can occur in the same task. Test design completion is not a
product pass. Distinguish unimplemented checks or behavior, an unavailable entry
or environment, a real observed failure, mock-only success, and a real-system
pass. Human acceptance requires an explicit record; automation cannot infer it.

## Finish and Handoff

For design work, report the covered outcome, scenario/test locations, independent
expected-value basis, human path, and remaining implementation or environment
dependencies. Do not invent executable commands or passing results.

For execution, report the precise candidate, environment, applicable scenario
results and evidence, gaps, and human acceptance status. Preserve historical
evidence as history; changes to code, contracts, test assets, dependencies, or
configuration require an impact assessment before results support a new claim.
Do not silently carry a prior candidate's or environment's pass forward.

Route implementation failures to OPAID and delivery/recovery issues to CICD.
VERIFY does not deploy, promote, or roll back. Continue already authorized work
without adding approval stages; stop only actions outside the agreed scope or
environment permissions.
