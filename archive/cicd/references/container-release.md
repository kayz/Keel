# Strict Git-Tag and Container Release Profile

Use this profile only when the project explicitly adopts this Git-tag/container
policy; container use alone does not select it. These strict rules are not CICD
defaults for other projects. Obtain the service/image matrix, build platform,
registry, scan policy, target environments, and rollback compatibility rules from
the project release contract. Server/worker/UI is only an example topology.

For a new version, require the Human-authorized version tag to bind the exact
eligible protected default-branch tip and verified OPAID candidate. An explicitly
approved maintenance/release branch policy may select that branch instead. The
tag is immutable; source fixes require a new locally verified candidate and a
new Human-authorized forward-only version. Historical retries or rollback remain
bound to the original immutable tag and artifacts, not today's branch tip.

1. Run the project's full remote CI and supply-chain checks on the tagged commit.
   Use Linux when it is the declared target platform.
2. Build and push each required image under its exact Commit SHA identity. Record
   its manifest digest, source, effective build inputs, and workflow identity.
   Never replace an image already published under that immutable identity.
3. Scan every required image and collect the required provenance and SBOM evidence.
4. Wait for the entire required image set to pass before promoting those same
   manifests to the immutable version tag. Do not rebuild for promotion or publish
   a partially successful matrix under a shared release identity.
5. Deploy the test environment using the recorded SHA identities and verify their
   resolved digests, or pin directly to those digests where the project specifies.
6. Check technical readiness and give VERIFY the deployed digests, environment,
   spec revision, stable scenario IDs, fixtures, and real entrypoints for business,
   failure, persistence, and recovery verification. Record actual readiness and
   link VERIFY results; planned commands or service health do not prove business
   acceptance. Require current evidence again after each environment delivery.
7. On failure, preserve evidence and use the authorized rollback contract with the
   known previous immutable image set. Data/schema changes may prevent a safe
   rollback; check compatibility instead of assuming image rollback is sufficient.

Do not publish `latest` or `test-latest`, promote different manifests under an
existing version, bypass environment approvals, or infer production authority
from successful test delivery. The main skill's authorization and historical
release rules apply unchanged.
