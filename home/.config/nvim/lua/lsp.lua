-- lsp.lua
-- Language Server configuration

require("mason").setup()
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
require("mason-lspconfig").setup({
  ensure_installed = {},
  automatic_enable = true,
})

local packages = {
  "awk-language-server",
  "bash-language-server",
  "deno",
  "docker-compose-language-service",
  "dockerfile-language-server",
  "dot-language-server",
  "eslint-lsp",
  "gopls",
  "html-lsp",
  "intelephense",
  "lua-language-server",
  "marksman",
  "sqls",
  "terraform-ls",
  "vim-language-server",
  "vue-language-server",
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("warwick-lsp", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

return {
  install = function()
    local registry = require("mason-registry")
    registry.refresh(function(success, error_message)
      if not success then
        vim.notify("Could not refresh Mason registry: " .. error_message, vim.log.levels.ERROR)
        return
      end

      for _, name in ipairs(packages) do
        local found, package = pcall(registry.get_package, name)
        if not found then
          vim.notify("Unknown Mason package: " .. name, vim.log.levels.ERROR)
        elseif not package:is_installed() and not package:is_installing() then
          package:install()
        end
      end
    end)
  end,
}
