# Architecture and acceptance

## Architecture baseline

Start from accepted choices. For a new baseline, prefer deep modules with narrow
interfaces and explicit composition. Each module declares responsibility and
non-goals, inputs/outputs/errors, owned state/invariants, allowed dependencies,
and verification seams. Use an existing module when the capability belongs there.

Keep domain rules independent of UI, storage and provider details where the
project design allows. Use ports/adapters at real external boundaries and one
owner for each state/decision. Reuse contracts; avoid competing helpers,
duplicate formulas, speculative abstractions and empty plugin frameworks.
Separate deployment needs a real isolation, scaling, security or lifecycle reason.

Choose actual stack checks: import/package dependency rules, public contract
tests, persistence/invariant checks and critical user-path integration. Do not
invent a universal architecture-check command. Design properties that cannot
be proven by a dependency graph still need review.

## A finite, observable capability

For each in-scope business capability, establish:

- User result and normal starting state, including discoverable inputs.
- Owning module, public use case, state ownership and relevant consumers.
- A real operation or observation entry using that same use case.
- Expected outputs, important failures, units/context when relevant, and readback.
- Automated evidence and a repeatable human walkthrough with a stopping point.

Use existing feature identities when available. A page can serve several
capabilities, and a capability can have several entries. A background worker
can expose read-only progress/failure evidence. Utilities, internal RPCs and
refresh buttons do not each require an ID or page.

For a GUI product, verify the normal GUI path without secret IDs, temporary
scripts or manually assembled requests as substitutes. For a CLI/library, use
its actual interface plus readable output/examples; build a visual surface when
the agreed product needs it. UI displays authoritative results rather than
recomputing business rules for presentation.

## Verification layers and evidence

| Layer | Typical evidence |
| --- | --- |
| Domain | Invariants, boundary cases, independent reference values when needed |
| Use case / contract | State transitions, authorization, failures, compatibility |
| Integration | Real storage/provider or worker path, persist/readback, recovery |
| User path | Normal entry to actual outcome, relevant errors, refresh/revisit |
| Human acceptance | Explicit judgment for the specified candidate and scenario |

Keep combinatorial checks near the rule. Use a small relevant set of real
end-to-end paths; mock/layout tests prove their declared scope only. Fixtures
may be shared, but numerical expectations need an independent basis. Calculating
expected values with the same implementation is not an independent oracle.

Distinguish **implemented**, **integrated with real dependencies**, **runtime
verified in an identified environment**, and **human accepted**. These are
evidence dimensions, not a mandatory new registry. Link existing tests/reports
and acceptance records, identify the candidate/environment, and expose stale or
missing evidence. HTTP 200, registration, a screenshot or green unit tests alone
cannot establish business correctness.

## Optional capabilities

Select those relevant to the product:

- **Numerical results:** independent oracle, stable input/rule versions, fixed
  tolerance, precision and units. Authorized semantic changes update the basis
  explicitly; a mismatch does not justify relaxing tolerance.
- **Asynchronous execution:** idempotency, retries, persisted state, cancellation
  where supported, actual worker execution and intelligible failures.
- **Local documents/data:** save/reopen, interruption and recovery, migration
  compatibility and protection of original user data.
- **Release:** artifact type, supported platforms, identity/provenance, applicable
  build/scanning checks, environment walkthrough and rollback policy.

The release capability defines the contract and target environments. CICD executes
authorized delivery and technical readiness; VERIFY uses the same scenario
identities to verify business outcomes after each environment delivery, and CICD
consumes those results before an authorized promotion. Agree data/effect limits
and recovery policy per environment; do not run destructive test fixtures against
production by default. Use the project's chosen build, source and release tools.
Do not impose a server/container topology on a desktop or package release.

## Scope change and stopping

Hold one finite iteration outcome. Extra independent features stay outside
current acceptance unless the user explicitly adds them. Repair in-scope defects
without reopening all design. For material conflicts, identify the affected
agreement and concrete choices; act on existing authorization or ask only for
the unresolved decision.

OPAID ends at the locally verified candidate and human review surface. Required
human acceptance remains pending until given; release readiness follows the
project contract. Passing local tests does not start CICD. Existing authorization
for a full chain need not be requested again.
