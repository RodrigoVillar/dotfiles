# Dotfiles

Rodrigo's dotfiles managed with Nix Home Manager.

## Structure

- `home-manager/` — Home Manager flake and config (flake.nix, home.nix)
- `nvim/` — Neovim config (Lua, lazy.nvim plugin manager)
- `ghostty/` — Ghostty terminal config
- `lazygit/` — Lazygit config
- `nix/` — Nix package manager config
- `starship.toml` — Starship prompt config
- `Taskfile.yml` — Task runner commands

## Home Manager

Dotfiles are symlinked to `~/.config` via Home Manager (`home.file` in `home-manager/home.nix`). Packages are also declared there.

The flake has two configurations keyed by `$USER`:
- `rodrigo` — personal machine
- `rodrigo.villar` — work machine

To apply changes: `task switch` (or `home-manager switch --flake ./home-manager#$USER`).

When adding a new config directory, add a corresponding `home.file` entry in `home-manager/home.nix` using `./../<dir>` as the source path.

## Conventions

- Theme: Catppuccin Mocha across all tools
- VCS: Jujutsu (jj), not raw git — use `jj` commands for version control
- Neovim LSP configs live in `nvim/lua/lsp/`, plugins in `nvim/lua/plugins/`
- Formatters/linters are configured in `nvim/lua/plugins/conform.lua`
