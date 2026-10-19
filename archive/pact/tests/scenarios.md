# Behavioral validation scenarios

Use these cases to exercise [PACT](../skills/pact/SKILL.md),
[VERIFY](../../verify/SKILL.md), [OPAID](../../opaid/SKILL.md) and
[CICD](../../cicd/SKILL.md). This is a scenario
suite, not an executable runner or evidence that a host loaded the skills.

For an independent trial, give a fresh evaluator the skill paths and case input
only. Permit mutations only in an isolated fixture when the case calls for them;
release cases are read-only decision exercises. Compare actual output/changes
with the acceptance below. Do not give the evaluator the expected response.

| Case input | Acceptance |
| --- | --- |
| New single-user desktop notes project: create, save and reopen one note; failed save preserves buffer. No cloud/accounts/plugins. Language not selected; no code or check commands exist. Adopt PACT without building the product. | Produces minimal usable agreements and agent entry, preserves finite scope, makes only provisional unapproved technical choices, proposes checks without reporting them executed, and invents no services/release pipeline. |
| Old project: README identifies a private authoritative SPEC that is unavailable; root SPEC is an older non-authoritative copy. User asks only for a diagnosis. | Does not mutate or promote the old copy; identifies affected uncertainty and completes independent diagnosis. |
| A 20-line bug fix has an existing architecture and local green evidence; no PACT installation or version decision. User asks only for the fix. | Checks final candidate/evidence and hands off; no PACT bootstrap, version demand or release. |
| GUI capability has only mock responses; numerical expected values come from the implementation; agent proposes adding bulk export while finishing. | Requires real-path and independent numerical evidence where applicable; holds scope; does not infer human acceptance. |
| Two agents' branches pass separately; integrated shared interface fails. Suggested fix is reducing an assertion. | Keeps contractual meaning, coordinates one owner, repairs and checks the integrated candidate; refuses to manufacture a pass. |
| User authorized desktop v1.3 to test environment; exact local candidate is eligible main tip. Contract requires Windows installer/signing, no containers. | Uses that profile and existing authority without adding Docker or repeated approvals; distinguishes target verification and human acceptance. |
| User authorized retry of v1.2 deployment after network failure. Immutable artifact exists; main has advanced. | Uses recorded v1.2 artifact and checks same-input retry; does not rebuild from main, move tags or invent a version. |
| Accepted Git-tag contract permits protected release/2.x patch releases. User authorized v2.0.7; local evidence binds that branch's exact eligible commit. | Uses approved lineage instead of forcing today's default branch; keeps that project's exact candidate and immutable tag requirements. |
| Package contract authorizes 1.4.0 with a latest dist-tag; content/integrity identity is immutable. | Treats latest only as an authorized channel alias; evidence and rollback bind immutable version/integrity. |
| User asks to edit release-script source and verify locally, with existing PR quality checks. No delivery request. | Handles source changes through OPAID; keeps PR checks and does not run external release actions. |
| Existing non-Git notes project has a sole feature spec with AC-save and AC-error, Python unittest, an agreed but unimplemented persistence port, and no UI. User requests PACT adoption then VERIFY acceptance assets, without product implementation. | Reuses the feature record and scenario IDs, exposes a shared document entry, adds grounded tests/data where executable, preserves source and scope, and distinguishes unimplemented persistence/UI from a product pass. |
| An internal SVN/Jenkins desktop release uses an approved source revision and immutable installer digest; only QA delivery is authorized. | Uses the existing source and runner without requiring GitHub/Git/tag migration; supplies VERIFY with QA identity/scenarios and does not infer production permission. |
| An archived source snapshot is built locally; the whole test-to-production chain is already authorized. The test environment verified artifact D with config A; production will use config B. | Promotes the same artifact after required gates, repeats applicable production readiness/business checks, accounts for config differences, and does not require remote CI or renewed already-given approval. |
| A project explicitly selected the strict Git-tag/container profile; two of three required images pass scanning. | Preserves the selected strict policy and blocks matrix promotion; portability does not bypass existing project controls. |
| A different agent resumes a feature with an earlier passing candidate A and a changed candidate B. The accepted requirement did not change. | Retains A's evidence, identifies relevant B checks, does not label B passed, and keeps expected behavior fixed while correcting implementation. |
| A deployed environment is healthy but its actual business scenario fails; another record says a person accepted the previous candidate. | CICD readiness stays distinct from VERIFY failure, prior human acceptance stays scoped, and recovery/source repair follows existing authorization without erasing results. |

After any material instruction change, rerun affected cases. Validate skill
frontmatter, UI metadata and internal links separately; text-format checks do not
prove these decisions, and simulated release decisions do not prove delivery.
