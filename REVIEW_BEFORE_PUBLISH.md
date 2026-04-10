# Review Checklist Before Any Public Publish

## Security
- [ ] Formula URL points only to https://browserpilot.seedsource.dev/releases/
- [ ] Formula does not include extension or bridge source files
- [ ] Activation authority remains locked to https://browserpilot.seedsource.dev
- [ ] Bootstrap package surface gate passed (minimal files only)

## Artifact Integrity
- [ ] Formula sha256 matches current browserpilot-bootstrap-<version>.tgz
- [ ] Formula installs browserpilot-bootstrap binary correctly
- [ ] `browserpilot-bootstrap --help` works
- [ ] `browserpilot-bootstrap install` works on clean macOS

## Non-Public Guard
- [ ] Confirm this repo still has no remote or no public remote
- [ ] Confirm no push has occurred
- [ ] Confirm manual approval completed before any publish action
