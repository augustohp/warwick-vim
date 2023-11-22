" init.vim
" nvim configuration
" vim: ts=2 sw=2 ft=vim:

" load vim configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" ------------------------------------------------------------------------------------------------------
"  Vanity

colorscheme catppuccin-mocha

" ------------------------------------------------------------------------------------------------------
" Language Server

lua <<EOF
  -- How issues on the code is displayed
  vim.diagnostic.config({
    -- Do not display inline text issues
    virtual_text = false,
    float = {
        source = "always",
        border = "rounded",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
EOF

" Mason (automatic LSP server installation)
lua <<EOF
  require("mason").setup()
  local mason_lspconfig = require'mason-lspconfig'
  local lspconfig = require('lspconfig')
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local handlers = {
    ["intelephense"] = function ()
      lspconfig.intelephense.setup {
          capabilities = capabilities,
          init_options = {
            licenseKey = "00JEYSEM842Z7N9"
          },
      }
    end
  }
  mason_lspconfig.setup {
    handlers = handlers,
    ensure_installed = {
      "awk_ls", "bashls", "denols", "dockerls", "docker_compose_language_service",  
      "dotls", "eslint", "gopls", "html", "tsserver", "lua_ls", "marksman",
      "intelephense", "psalm", "pyright", "sqls", "terraformls", "vimls",
      "vuels"
    },
    automatic_installation = true
  }
EOF

" Autocompletion
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  -- <C-n> and <C-p> still work
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline {
      ['<C-n>'] = cmp.config.disable,
      ['<C-p>'] = cmp.config.disable,
    },
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  -- Auto-complete setup
  cmp.setup({
    snippet = { -- required
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    view = {
      -- Most ranked completion near cursor (top-down or bottom-top depending on the popup)
      entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        preset = 'default',
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'emoji' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })
EOF

" ------------------------------------------------------------------------------------------------------
" Better syntax highlight (Treesitter)

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "lua", "make",
    "vim", "vimdoc", "query",
    "javascript", "typescript", "json", "jq", "jsdoc",
    "http", "html", "php", "phpdoc", "ini", "xml",
    "latex", "markdown", "mermaid",
    "bash", "hcl", "diff", "dot", "ssh_config", "terraform",
    "git_config", "gitcommit", "gitignore", "git_rebase", "gitattributes",
    "go", "gomod", "gosum", "gowork"
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},

  indent = {
    enable = true
  },

  highlight = {
    enable = true,
    disable = {},
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
          return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}
EOF
