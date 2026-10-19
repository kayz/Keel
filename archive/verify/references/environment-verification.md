# Business Verification After Delivery

Use this reference after CICD has delivered a candidate to a named environment.
Reuse the predesigned acceptance assets and the project's existing operational
records, rather than creating a new test plan from the implementation.

## Bind the Environment and Candidate

Read the delivery handoff: immutable artifact identity where applicable, source or
candidate identity, effective spec and scenario revisions, target environment,
access entry, configuration/dependency differences that affect behavior, and
technical readiness evidence. Do not expose secrets in the record. If the running
identity is unclear, resolve it before assigning acceptance to that candidate.

Read the environment's authorized data, operations, external side effects,
cleanup, and failure policy. Existing authorization can cover the whole chain;
do not request it again. Test-environment access does not imply production access
or permission to act on real users' data.

Test and preproduction environments can run the required full integration,
failure, persistence, or recovery scenarios when their data and side effects are
authorized. Production uses the agreed safe subset, including restricted test
accounts or isolated writes when authorized and their cleanup. A production
subset does not retroactively prove omitted full acceptance checks; preserve the
required preproduction evidence and disclose remaining gaps.

## Execute Against the Delivered System

Use the actual delivered entry and required dependencies for the scenario.
Mocks, a rebuilt local binary, or a different artifact cannot establish the
delivered system's pass. If a dependency is intentionally simulated by the
environment contract, identify that limitation and the actual scope validated.

Check expected business behavior through the agreed interface and visible user
or operator surface. Technical readiness, health checks, and successful HTTP
responses are prerequisites or observations, not substitutes for business
assertions. Exercise the applicable failure and state-change behavior already
agreed for this environment; do not add destructive probes during execution.

For each applicable scenario, capture its identifier, effective inputs, expected
and actual results, evidence or run reference, candidate, and environment. Reuse
the test runner's structured result when it contains these facts and link missing
context from the existing brief. Record unavailable checks and mock-only outcomes
separately from real failures and real-system passes. Retain sufficient fixture
and environment context to repeat the check without publishing sensitive data.

## Respond and Preserve Evidence

When a scenario fails, preserve the observation and identify whether the evidence
points to implementation, test design, an unresolved requirement, or environment
delivery. Route the correction to the responsible workflow. Do not weaken the
expected result just to obtain a pass, deploy a fix, promote a candidate, or
perform a rollback under VERIFY's responsibility.

Follow the existing stopping and cleanup policy. Any recovery or rollback belongs
to CICD and its existing authority, including data/migration compatibility; an
application rollback does not itself establish restored data correctness.

After corrections, verify the new candidate or changed environment with the
required checks for the affected scope. Old results remain historical facts.
Reusing unaffected evidence requires an explained applicability basis; changing
the candidate or environment never silently grants it an earlier pass.

Return the evidence and unmet conditions to CICD for its promotion decision.
Passing in test does not authorize production delivery. A production delivery
requires its own applicable verification, using the same immutable artifact and
explicitly accounting for environment differences. Keep any human acceptance
record explicit about who accepted which candidate, environment, and scope; if
none exists, report human acceptance as pending.
