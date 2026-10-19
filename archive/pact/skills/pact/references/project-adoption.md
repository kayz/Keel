# Project adoption and cross-agent use

## Keep one home per decision

| Home | Owns |
| --- | --- |
| SPEC or existing requirements | Intended behavior, scope, non-goals |
| Architecture / module contract | Responsibilities, state, dependencies, public contracts |
| ADR or equivalent decision | Rationale, compatibility impact, superseded decisions |
| Existing issue or sole brief | This slice's result, acceptance scenarios, exclusions and scoped evidence; human console for the current outcome |
| Root/subtree AGENTS.md | Short working instructions, source navigation, check entry points |
| Project skills | Reusable methods for adoption, implementation or release |
| Tests / checks / reports | Executable constraints and observed candidate/environment evidence |

These are responsibilities, not a requirement to create each named file. Reuse
effective locations. Distinguish desired behavior from an account of current
implementation; the latter cannot silently redefine the former. Record
supersession when an accepted decision changes, and update its index.
Map these locations to the [shared document protocol](document-protocol.md).
The project entry selects one effective convention for all participating skills;
do not let each skill generate its own specification or acceptance copy.

## New project

Derive the first finite user path and essential constraints from the request.
Choose a minimal architecture and verification approach compatible with them.
Use ordinary modules and existing tools unless a need justifies more. For a
substantial feature, retain the outcome and non-goals in the chosen durable task
record; a tiny fix can remain in its existing issue.

Label the basis of derived requirements. Keep provisional technical choices
revisable until a real compatibility or coordination need requires a contract.
Do not freeze a storage format, API shape, or additional recovery guarantee just
because a template has room for it. Test the agreed behavior; propose additional
scope separately. Necessary safeguards may be working defaults, with their
assumptions visible rather than described as already Human-approved requirements.

Create a short agent entry referencing effective documents. Select only skills
the current work needs. Release configuration can wait until release is in scope.
Do not make accounts, deployment infrastructure or a role hierarchy a prerequisite
for proving a local user path.

## Existing project

Inspect current entry points and accepted design. Identify conflicts with
evidence: source and revision, consequence, proposed reconciliation. Preserve
stable interfaces, valid tests, unrelated edits and authoritative private/public
boundaries. Start with the requested module/iteration when whole-project
migration has not been authorized.

An inaccessible private specification is a dependency, not an invitation to
reconstruct authority. Report affected decisions and continue work whose meaning
is established. An authorized snapshot requires explicit origin/revision and
applicability; a convenient local copy is not automatically authoritative.

When adopting these skills from another workflow, explicitly select replacement
responsibilities. Do not run two task state machines or copy status into a new
ledger. Keep useful decisions/evidence and change conflicting active instructions
only within the authorized migration scope.

## Portable installation

Use complete skill folders in the selected host's supported project skill layout;
`.agents/skills/<name>/SKILL.md` is a shared layout where supported. Keep one
effective copy per skill and make tool-specific entry files point to shared rules.
Include all internal references/assets; do not retain links to the maintainer's
absolute paths or sibling skills' private resources. Each of PACT, VERIFY, OPAID
and CICD explains its own boundary without requiring a sibling file to exist.
Selected workflow dependencies must be accessible.

Record the selected source revision and local adaptations in existing setup
documentation, or optional `.agents/project.json` when structured installation
metadata is useful. There is no required JSON schema or loader in this edition.
This records configuration only, never live task status. Identify an uncommitted
or unpublished snapshot as such; do not call it a published version. Source-control
revisions or content digests can identify it; Git and a hosting provider are not
required. `agents/openai.yaml` is optional host UI metadata, not common workflow
logic or a dependency on an OpenAI runtime.

Keep shared semantics in repository-controlled files. Tool-specific rules select
common sources or adapt available commands. Personal instructions, host precedence
and loading can differ; repository agreements cannot override host permissions.
Report conflicts and resolve affected setup without silently weakening contracts.

For each agent used by the team, verify applicable instruction sources, skill
paths and versions using available host inspection/logging and a bounded task.
A model's assertion that it read a rule is not enforcement. Mark unavailable
host tests unverified; one Codex run does not certify Cursor or DeepSeek Harness.
Do not configure unrequested hosts to complete a repository-level edit.

## Updates and ownership

Compare source changes with the baseline and project-local changes. Produce a
reviewable patch, preserve project-owned decisions, and expose conflicts instead
of overwriting them. Without a trustworthy baseline, diagnose/manual-map before
treating files as tool-owned. Old evidence retains its original candidate and
agreement revision when new adoption takes effect.

Changes to accepted architecture, expected behavior or critical check definitions
follow the relevant owner's review. Configure executable protections when
authorized; documentation alone is not a merge gate. Routine fixes within an
accepted contract do not need new design approval.
