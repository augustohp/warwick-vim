-- lsp.lua
-- Language Server configuration

require("mason").setup()
local mason_lspconfig = require'mason-lspconfig'
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local handlers = {
  -- default handler
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end,
  -- specific handlers
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
    "awk_ls",
    "bashls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "dotls",
    "eslint",
    "gopls",
    "html",
    "intelephense",
    "lua_ls",
    "marksman",
    "sqlls",
    "terraformls",
    "vimls",
    "vuels",
  },
  automatic_installation = true
}

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
