# Repository instructions

These rules apply to every change in this repository.

## Formatting

Never imitate `nixfmt` output manually.

Before every commit that changes a `.nix` file, run:

```sh
nix run .#format
```

The equivalent standard flake command is:

```sh
nix fmt
```

When only specific files changed, pass them explicitly:

```sh
nix run .#format -- path/to/file.nix another/file.nix
```

After formatting, inspect the diff and run:

```sh
git diff --check
```

Entering `nix develop` installs the repository pre-commit hook into the active Git worktree. The hook formats staged Nix files, stages the formatted result again, and runs `git diff --cached --check`.

## Validation

Run the shared checks once:

```sh
nix flake check --print-build-logs
```

Build only the affected host when possible:

```sh
nix build .#nixosConfigurations.nixlensk321.config.system.build.toplevel --no-link
nix build .#nixosConfigurations.nixlensk322.config.system.build.toplevel --no-link
```

Do not run the same flake checks separately for both hosts. CI has one shared check job and a host build matrix.

## Git safety

- Do not edit `flake.lock` manually.
- Do not commit credentials, private keys, Telegram sessions, API hashes, local state, or generated `result` links.
- Do not force-push or rewrite unrelated history.
- Keep commits scoped and inspect the final diff before pushing.
