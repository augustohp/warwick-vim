-- nvim-cmp.lua
-- LSP completion with explicit, predictable controls.

local cmp = require("cmp")
local lspkind = require("lspkind")

local function has_words_before()
  local line, column = table.unpack(vim.api.nvim_win_get_cursor(0))
  if column == 0 then
    return false
  end

  local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
  return text:sub(column, column):match("%s") == nil
end

local function feedkey(key, mode)
  local keys = vim.api.nvim_replace_termcodes(key, true, true, true)
  vim.api.nvim_feedkeys(keys, mode, true)
end

cmp.setup({
  performance = {
    debounce = 150,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    completion = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({ mode = "symbol_text", preset = "default" }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-n>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }),
})
