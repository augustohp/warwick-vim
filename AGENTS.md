# Warwick Vim Instructions

Before changing this castle, read and follow `../warwick/AGENTS.md`. This file
contains only castle-specific additions and restrictions. If the shared file is
unavailable, stop before modifying this castle.

## Vim and Neovim

- `home/.vim/vimrc` owns shared Vim configuration.
- Filetype-local behavior belongs under `home/.vim/after/ftplugin/`.
- Keep one canonical implementation for each plugin behavior; do not duplicate
  mappings in `vimrc` and an ftplugin.
- Preserve headless Vim use and avoid GUI, CPU, or home-path assumptions.
- Validate affected behavior in both Vim and Neovim when applicable.
- For mapping changes, inspect the effective buffer mapping with `:verbose nmap`.
- Avoid plugin installation or network access during unrelated validation.
