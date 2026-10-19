---
name: cicd
description: Build and deliver a Human-authorized immutable candidate, establish environment technical readiness, and use VERIFY conclusions for promotion or rollback. Use for version delivery, artifact publication, environment operations, and read-only release diagnosis; ordinary development does not authorize delivery.
---

# CICD

## Purpose

Build and deliver an authorized immutable candidate, prove the environment is
technically ready, and carry out authorized promotion or rollback using current
business verification evidence. Keep source, artifacts, operations, and results
bound to the same release identity.

PACT maintains shared document contracts. VERIFY designs acceptance assets early
and owns business verification after each environment delivery. OPAID owns
implementation, unit tests, and applicable local integration. CICD owns build,
artifact delivery, environment readiness, promotion, and rollback; it consumes
VERIFY conclusions rather than declaring business acceptance from health checks.
Route source fixes to OPAID and semantic contract changes to PACT's responsibility.
These are workflow responsibilities, not provider APIs or mandatory new sessions.

## Project Release Contract

Follow AGENTS.md or the project's existing entry to the effective shared
specification, release contract, scenario assets, and evidence locations. Resolve
their applicable versions and authority before choosing commands; do not assume a
sibling PACT directory, skill installation, or a provider-specific document store.
Identify source eligibility, release identity format, artifact set and platforms,
applicable scans/signing/provenance/SBOM, target environments, technical readiness,
VERIFY gates, automatic side effects, rollback, and authorization boundaries.

Use the project's existing VCS or source snapshot mechanism, build runner, and
delivery profile: container services, desktop installers, packages, or another
artifact type. Builds may run locally or on the project's selected service.
Do not impose Git, GitHub, a remote CI provider, Linux, Docker, or a registry.
Do not modify the project's chosen platform configuration merely to fit this
skill. If the project explicitly adopts the strict Git-tag/container profile,
read [references/container-release.md](references/container-release.md).
If a material contract or authority decision is missing, prepare the concrete
candidate and release plan before requesting only that decision.

## Authority and Immutable Identity

Read-only inspection of code, workflow configuration, logs, and existing releases
does not require a new version decision. Inspection does not authorize retry,
publication, deployment, or rollback.

Before a release or environment mutation, resolve the requested operation, exact
version or release identity, environment, and authorized side effects. Require
explicit Human authorization for version/delivery operations under the project
contract. Do not infer it from a source update, merge, local test pass, Agent plan,
or iteration brief. Preserve existing quality gates. Reuse an already authorized
full chain without asking again at each step.

For a **new release**:

1. Resolve the authorized version/delivery and the project's identity format. If
   a required version decision is missing, obtain that decision before creating
   the identity; do not invent a version or an unrequested delivery.
2. Bind the eligible source to an immutable revision or reproducible snapshot
   digest and the exact OPAID evidence. Follow the project's source policy; there
   is no universal current-main or Git-tag requirement. A moving name alone is
   insufficient. Changed or integrated source must be locally reverified before
   release.
3. Bind the release identity, effective build inputs, complete artifact identities,
   and applicable specification/scenario versions in existing release records.
   When Git tags are the selected strategy, require the authorized exact tag and
   commit, keep the tag immutable, and honor that project's branch eligibility.
4. Check automatic side effects before creating the release identity. Never move
   or reuse an immutable identity to conceal a changed or failed candidate.

For **existing-release inspection, retry, or rollback**, bind to the recorded
release identity, immutable source, and artifact identity. Historical releases
need not equal today's source head. A retry may address a transient failure only
with the same source, effective build inputs, rules, and artifact identity where
already produced; never overwrite an existing artifact or retag a changed build.
Deploy or roll back using the recorded artifact, rather than rebuilding it.
Changed source or effective build inputs require a newly verified candidate and
a new authorized release identity; preserve prior versions. A changed spec or
scenario invalidates the corresponding old VERIFY conclusion even when the
artifact is unchanged. Rollback requires compatibility checks and authority.

## Delivery, VERIFY, and Promotion

Execute the authorized project workflow:

1. Run the declared build and technical checks on the exact source, platforms,
   inputs, and runner. Record actual outputs and failures.
2. Produce the complete required artifact set with immutable identities and the
   applicable integrity, supply-chain, and signing evidence. Promote or publish
   only when the required set passes; do not promote a partially successful matrix.
3. Install or deploy those same artifacts in the authorized target environment.
4. Check technical readiness: required components, configuration, dependencies,
   migrations, connectivity, and health under the project contract. Record the
   deployed identities and environment. Ready means VERIFY can run; it does not
   mean business behavior passed.
5. After each environment delivery, hand VERIFY the applicable stable scenario
   IDs and spec revision, exact candidate/artifacts, environment, fixtures, and
   real operation/observation entrypoints. Consume its recorded conclusions for
   that combination. OPAID or CI may execute scenario tests; VERIFY owns the
   acceptance basis and environment conclusion. A prior environment or candidate
   pass does not qualify the current one. Missing or blocked required verification
   prevents a pass claim and promotion that depends on it.
6. Promote the same artifacts only when the contract's technical and VERIFY gates
   pass and the next environment is authorized. Delivering to the next environment
   starts its own readiness and VERIFY checks. On technical or business failure,
   use the authorized recovery/rollback policy and preserve the failed evidence.

Never use mutable `latest`, `test-latest`, or another channel alias as the release
identity or rollback evidence. A project that explicitly uses package channels
may update an authorized alias to an already verified immutable version; retain
the version and digest as evidence and honor stricter profile rules. Use the
project's existing entrypoints when handing off to VERIFY; do not introduce a new
UI as part of delivery. If VERIFY is unavailable, use its documented project
equivalent when authorized or report the missing gate; never fabricate a pass.

Production release remains a separate Human-authorized action even when a version
has passed a test environment. That production authorization may already be
included explicitly in the Human's request; do not ask again. Respect the
project's environment approvals, secrets, operational boundaries, and rollback
contract.

## Result Handoff

Report release and source identities, build/operation identities, artifacts,
technical readiness, referenced VERIFY conclusions, promotion/rollback outcome,
blockers, and residual risks. Write CICD facts to the existing shared evidence
locations, linking stable scenario IDs, spec revision, candidate, and environment.
Preserve historical evidence; do not overwrite it as a current pass, change
scenario meaning, or create a parallel release ledger.

Distinguish OPAID local tests, CICD technical readiness, VERIFY business results,
and Human acceptance. One does not substitute for another; without an explicit
Human acceptance record, describe it as pending rather than accepted. Finish when
the authorized delivery scope is complete, or report the exact blocking boundary.
