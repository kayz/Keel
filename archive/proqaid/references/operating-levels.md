# PROQAID Operating Levels

Read this file only when selecting or changing the iteration level or a risk
overlay. Routine `ACTIVE` work follows the recorded selection without reloading it.

## Lite

Lite is a fast prototype or feasibility loop:

- one sharply bounded outcome;
- run affected responsibility profiles as direct sibling Role Agents when their
  independent work can use otherwise idle orchestration slots;
- use as many disjoint ready Workers as produce net speedup within tool capacity;
- worker self-test and a concise result summary;
- Quality only when Delivery hands off the prototype in a ready test environment;
- Review only when the prototype produces a final document set, with those
  documents as its complete input;
- environment checks limited to capabilities required to run the prototype.

Lite evidence demonstrates the prototype scope only. It is not automatically
valid as production, SIT, release, migration, recovery, or security evidence.

## Governed

Governed is the default formal iteration:

- one authoritative checklist and formal exit state;
- parallel direct sibling Role Agents for affected Product, Architecture, Interface,
  and Delivery work when their inputs and results are independent;
- one scheduling layer controlled by the Root through the orchestration tool;
- independent Quality testing only after Delivery hands off the exact candidate in
  the ready test environment;
- document-only Review after the final document set exists, skipped when none exists;
- bounded workers with executed self-tests and candidate-bound evidence;
- phase-specific development, SIT, and release prerequisites;
- cleanup, accepted-risk, and final-candidate records.

Governed does not require every role, environment, or test layer to be active.
Mark unaffected responsibilities and phases once; do not manufacture work for them.

## Targeted Risk Overlays

Add only overlays triggered by the changed boundary:

| Overlay | Additional gate |
|---|---|
| Numerical/business calculation | independent Oracle, tolerance owner, representative datasets |
| Security/supply chain | threat or advisory scope, deterministic scan, explicit risk acceptance |
| FFI/unsafe/memory/concurrency | ABI, ownership, sanitizer or equivalent boundary evidence |
| Transaction/recovery | failure injection, idempotency, rollback/replay evidence |
| Migration/persistence | forward/backward plan, representative data, rollback evidence |
| Public interface | compatibility and consumer-contract evidence |

An overlay adds a local owner and evidence requirement. It does not reactivate
unaffected roles or convert the iteration into a larger operating level.

## Selection Rules

Use Lite when the user explicitly asks for a prototype or feasibility result.
Use Governed for a formal iteration intended to close against business acceptance.
If Lite discovers a production claim or high-risk boundary, stop and ask whether
to create a Governed iteration; do not silently reinterpret prototype evidence.
