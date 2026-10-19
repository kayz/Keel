# Shared document protocol

Protocol edition: 1. This labels the reusable format, not a product version or
an executable schema. Map existing project documents to these meanings; do not
require a new file for each section or convert a small fix into a specification
project. Keep one authoritative home for each fact.

## Human console and reading path

The existing project entry links accepted specifications/design decisions, the
current bounded feature or task, this project's document convention, and actual
check/evidence locations. AGENTS or the host's equivalent points to that entry;
it does not duplicate the specifications. Resolve effective sources and their
revisions, including private authority, before relying on them.

Present the current feature's user result, scope, real acceptance entry, expected
behavior, actual verification summary and remaining work first. Link detailed
contracts and logs afterwards. A person should be able to perform acceptance
without reading source code, discovering hidden IDs or interpreting a build log.
Document navigation does not replace the actual product operation/observation
surface. The console summarizes owning records; it is not a second status ledger.

## Three kinds of information

### Agreements: intended behavior

- Identify the finite user result, non-goals and completion conditions.
- Link effective requirements/design sources and applicable revisions. Separate
  accepted requirements, revisable working defaults, proposals and superseded
  decisions. Do not infer approval merely because text exists in a document.
- Identify affected module responsibilities, public contracts, state ownership
  and design constraints, using their existing owning documents.
- Use a stable feature/task identity where needed for traceability. Reuse the
  current issue or sole brief; no particular tracker or source-control system is
  required. A file revision or content snapshot can identify the agreed basis.

### Acceptance scenarios: how to establish the result

Give substantive scenarios stable local identifiers, such as AC-01; do not number
every helper. Each scenario connects its requirement to:

- Preconditions and reproducible input/data, with relevant reset/cleanup rules.
- Real operation/observation entry, steps, and observable expected results.
- The independent basis of the expectation, including tolerances where relevant.
- Applicable automatic tests/commands and human repetition steps. Record planned
  or unavailable test entrypoints honestly rather than inventing runnable commands.
- Applicable environments and allowed effects. Local, test and production may
  select different safe checks while keeping the same business meaning. Record
  required preproduction coverage and any remaining production limitations.

Tests reference scenario identifiers; reports use the same identifiers. Broad
scenarios can map to multiple tests and one test can support several scenarios.
Do not copy all test code into the specification or generate expected results
from the implementation under test. Human and automatic checks may observe
different aspects of the same outcome; neither silently substitutes for the other.

### Evidence: observed facts

Each meaningful result identifies the scenario, agreement/test revision, exact
candidate or artifact, environment and relevant configuration/data, executed
check, actual result, and evidence location. Reference existing reports rather
than pasting large logs. Never include secrets in configuration evidence.

Use unambiguous results: not run, blocked (with cause), failed, or passed within
the stated scope. Mark mocked/simulated dependencies and unimplemented tests;
a mock pass is not real integration. Keep implementation, integration, environment
verification and explicit human acceptance separate. Record who actually gave
human acceptance and its scope only when that record exists.

Preserve historical results with their original identities. Code, contract, test,
dependency or configuration changes may make them insufficient for the current
claim; select and rerun affected checks, explaining any reused evidence. An older
pass cannot simply be relabeled for a new candidate or environment. New runs add
results; they do not erase earlier failures or invent human approval.

## Responsibility and continuation

| Responsibility | Maintains or consumes |
| --- | --- |
| PACT | Agreement meaning, authority, document convention and linked console |
| VERIFY | Acceptance scenarios/assets, independent expectations, human steps, and environment business-verification conclusions |
| OPAID | Implementation links, unit tests, local candidate and local verification evidence; runs applicable existing acceptance assets |
| CICD | Build/artifact/deployment/configuration and recovery facts; consumes required verification evidence before promotion |

These are responsibilities, not exclusive file locks or required separate agents.
Use disjoint write ownership when parallel work would edit the same file. CI or
OPAID can execute VERIFY-designed tests; their location does not change the
expectation or require a second manual run merely to change skill labels.

At a handoff, read effective agreements, affected scenarios, the current candidate
and scoped evidence, then the unresolved work. Continue in the same record. Briefly
state material assumptions or conflicts; do not ask the human to reconfirm already
settled requirements. Pause only work dependent on unresolved authority or meaning.

Expected behavior changes require an authorized requirement change or a justified
test correction. State the basis and update affected scenarios/evidence together;
do not relax acceptance merely to fit faulty code. Extra ideas remain proposals
outside the current acceptance gate unless authorized.

Completion accounts for all applicable agreed conditions and omissions. A test
design can be complete while product checks are unimplemented; deployment can be
technically ready while business verification is pending. Neither means the
feature has passed acceptance. Human acceptance is required where the project
contract requires it, and is never inferred from silence or an automated pass.

## Portable use

Maintain this convention in one accessible project-owned location or explicitly
adopt a pinned installed copy. All selected skills locate it through the project
entry; they do not require another skill's private relative path. If a skill is
used alone, preserve these essential distinctions with the existing task/spec and
reports without requiring installation of the complete suite.

Markdown is the default human-readable representation; existing document systems
can carry the same fields and references. Executable tests remain in the project's
chosen framework. Source hosting, review requests, CI providers and host metadata
are adapters. A formatted document is not proof of correct understanding: check
source consistency, actual scenario/test links and scoped evidence, and evaluate
the behavior of each host when cross-agent adoption is in scope.
