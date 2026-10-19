# Acceptance Design

Use this reference when preparing acceptance before implementation or adding
repeatable verification to an existing capability.

## Ground the Expected Result

Read the accepted outcome, non-goals, module responsibilities, public input/output
and error contracts, state ownership, and real user action or observation path.
Identify only ambiguities that change acceptance; ordinary reversible test-tool
choices do not require a new architecture decision.

Use the project's current frameworks and conventions. Add the smallest assets
needed to exercise the accepted behavior, rather than introducing a universal
test platform. Do not invent internal APIs or extra product guarantees to make a
test convenient. Proposed edge cases are suggestions until their requirement
basis is established; they do not silently become required acceptance gates.

Expected results must have a basis independent of the implementation under test:
accepted examples, specified invariants, hand-derived values, authoritative
reference data, or another justified oracle. Fix any relevant tolerances before
comparing results. Copying production logic into a test, or capturing whatever
the current implementation returns, does not establish correctness. Existing
behavior may be recorded for characterization, clearly separate from accepted
desired behavior.

## Build the Acceptance Assets

Give each scenario a stable identifier in the existing spec or brief, linking to
the requirement and automated test. Reuse existing scenario identities. Include
the fixtures and preconditions, actions, observable expected results, relevant
failure behavior, and a repeatable human path. Scope environment restrictions
and data cleanup to scenarios that need them.

Cover the accepted public interface at its boundary, using the project's natural
interface type: an API, local module port, command, event, or another documented
contract. Test observable outputs, errors, and state transitions, not incidental
private methods. Unit tests remain part of OPAID's implementation work.

For functional acceptance, follow a real user or operator entry through the
intended system and inspect the business result. Each business capability needs
an appropriate action or observation surface; background work may use an existing
status view. Do not require a separate page for every helper. A document, mock
screen, screenshot, or direct data-store query alone does not prove the user path.

Human steps should use the same scenarios and representative inputs, with clear
visible results. Do not require hidden identifiers or source-code knowledge when
the accepted feature promises a normal user path. A prototype may clarify that
path before implementation; record its status without presenting it as delivered.

Prefer executable tests against the agreed public interface before implementation
when feasible. If the interface, application entry, or chosen stack is not yet
available, preserve concrete test cases and fixtures and state precisely what is
needed to make them executable. A missing entry or import failure is not evidence
that a meaningful behavioral assertion has failed. Mock tests can validate a
consumer or test setup, but real integration remains a separate obligation.

## Validate the Design Without Moving the Goal

Check that the scenarios collectively support the finite outcome, that their
expected results can be explained without reading the new implementation, and
that automated assertions could detect the relevant wrong behavior. Where useful,
use a small known-wrong input, stub, or controlled defect to test the checker;
do not claim this proves the product passes.

Run what can truthfully run in the current workspace and record the actual result.
Leave the remaining checks explicitly unimplemented or blocked by the named
dependency. OPAID and CI should reuse and run these assets as they become
executable, alongside their other required checks. Creating acceptance tests does
not require another agent, separate approval stage, or duplicate task record.
