# Warwick Vim Instructions

This castle owns shared Vim and Neovim configuration. Also follow
`../warwick/AGENTS.md` when that sibling castle is available. A standalone
checkout is valid; absence of the sibling must not block work.

## Product Direction

- Vim is the behavioral and performance baseline.
- Neovim may add native capabilities, but must preserve the same core mappings
  and avoid decorative popups, animations, or formatting. Network access is
  reserved for explicit online features such as Copilot.
- Telescope, Tree-sitter, and nvim-cmp/vsnip are intentional parts of the
  Neovim experience, not candidates for removal solely to reduce plugin count.
- Startup must work without plugins. Missing dependencies should produce one
  actionable message directing the user to `:WarwickInstall`.
- Installation and updates happen only through explicit commands, never during
  normal editor or shell startup.

## Configuration Ownership

- `home/.vim/vimrc` owns shared options, mappings, and plugin declarations.
- `home/.config/nvim/` contains only Neovim-specific behavior.
- Filetype behavior belongs under `home/.vim/after/ftplugin/` and must use
  `setlocal` and `<buffer>` mappings.
- Keep one canonical implementation for each behavior. Do not duplicate a
  mapping in the vimrc, Neovim Lua, and an ftplugin.

## Dependency Policy

- Prefer Vim or Neovim built-ins over plugins.
- Add a plugin only for a regularly used capability with no comparably simple
  built-in implementation.
- Avoid overlapping plugin responsibilities and decorative dependency chains.
- Lazy-load plugins whose capability is invoked by a command.
- Do not add automatic package, parser, or language-server installation to
  startup. Extend `:WarwickInstall` when installation belongs to this castle.
- Never commit licenses, tokens, credentials, or machine-local paths.

## Compatibility and Validation

- Support Vim 9 and Neovim 0.11.3+ on WSL2, macOS, headless Linux, and
  Raspberry Pi/ARM Linux.
- Preserve headless operation and avoid GUI, CPU, or absolute home-path
  assumptions.
- Validate clean startup before plugin installation and normal startup after it.
- Validate affected behavior in both Vim and Neovim when applicable.
- For mapping changes, inspect the effective buffer mapping with
  `:verbose nmap` or `:verbose imap`.
- Compare startup with `--startuptime`; do not publish an unmeasured target.
- Avoid plugin installation or network access during unrelated validation.
- Keep README capabilities and mappings synchronized with the configuration.
