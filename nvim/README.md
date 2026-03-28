# Neovim Configuration

Lua-based Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Structure

```
nvim/
├── init.lua                  # Entry point: loads lazy → options → LSP → keybindings
├── lazy-lock.json            # Plugin version lockfile
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # lazy.nvim bootstrap and setup
│   │   └── lsp.lua           # LSP server activation and diagnostics
│   ├── options.lua           # Editor options
│   ├── key_bindings.lua      # Global keybindings
│   ├── lsp/                  # Per-server LSP configurations
│   │   ├── gopls.lua
│   │   ├── lua_ls.lua
│   │   ├── rust_analyzer.lua
│   │   └── ty.lua
│   └── plugins/              # Plugin declarations (auto-discovered by lazy.nvim)
│       ├── autopairs.lua
│       ├── blink-cmp.lua
│       ├── catppuccin.lua
│       ├── conform.lua
│       ├── gitsigns.lua
│       ├── lazydev.lua
│       ├── lsp-config.lua
│       ├── lualine.lua
│       ├── marks-nvim.lua
│       ├── mason.lua
│       ├── mason-lspconfig.lua
│       ├── mason-tool-installer.lua
│       ├── neogit.lua
│       ├── nvim-tree.lua
│       ├── scope.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── treesitter-textobjects.lua
│       └── which-key.lua
```

## Leader Key

`<leader>` is set to **Space**.

## Keybindings

### Search & Navigation (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |

### LSP

| Key | Action |
|-----|--------|
| `<leader>pd` | Go to definition |
| `<leader>pt` | Go to type definition |
| `<leader>pr` | Find references |
| `<leader>r` | Rename symbol |
| `<leader>l` | Format buffer |

### File Tree

| Key | Action |
|-----|--------|
| `<leader>nt` | Toggle NvimTree |

### Git

| Key | Action |
|-----|--------|
| `<leader>gt` | Open Neogit |
| `<leader>gh` | Preview hunk |
| `]c` | Next hunk |
| `[c` | Previous hunk |

### Window Management

| Key | Action |
|-----|--------|
| `<leader>wh/wj/wk/wl` | Move to left/down/up/right window |

### Treesitter Selection

| Key | Action |
|-----|--------|
| `gnn` | Initialize selection |
| `grn` | Expand to next node |
| `grc` | Expand to scope |
| `grm` | Shrink selection |

### Text Objects

| Key | Action |
|-----|--------|
| `af` / `if` | Outer/inner function |
| `ac` / `ic` | Outer/inner class |
| `as` | Language scope |

### Other

| Key | Action |
|-----|--------|
| `<leader>h` | Clear search highlights |
| `<leader>?` | Show buffer keymaps (which-key) |

## Language Support

| Language | LSP | Formatters |
|----------|-----|------------|
| Go | gopls | gofumpt, goimports, golines |
| Lua | lua_ls | stylua |
| Rust | rust_analyzer | rustfmt |
| Python | ty | ruff |
| Markdown | — | prettier |

## Editor Settings

- **Theme:** Catppuccin (transparent background)
- **Indentation:** 4 spaces
- **Line numbers:** Absolute + relative
- **Color columns:** 80 and 100
- **Clipboard:** System clipboard
- **Format on save:** Enabled
- **Completion:** blink.cmp with super-tab preset (Tab to accept)

## Tool Management

LSP servers are installed by [Mason](https://github.com/mason-org/mason.nvim) via mason-lspconfig. Formatters and linters are installed via mason-tool-installer. Both run automatically on startup.

## Dependencies

Requires `ripgrep` and `fd` on the system PATH (used by Telescope).
