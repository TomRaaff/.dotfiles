local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  local function opts(description)
      return {
          desc = description,
          buffer = bufnr,
          remap = false,
      }
  end

  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts('[G]o to [D]efinition'))
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts('[G]o to [R]eferences'))
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts('display onHover docs'))
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts('goto next error / [D]iagnostic'))
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts('goto previous error / [D]iagnostic'))
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts('[R]e[N]ame function/variable'))
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts('[insert-mode] display function signature help'))
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts('?'))
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts('?'))
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts('?'))
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- code-completion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- select next item in the code completion list
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- select previous item in the code completion list
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- confirm code completion option
        ['<C-Space>'] = cmp.mapping.complete(), -- expand the code completion list
        ['<Esc>'] = cmp.mapping.abort(),
    }),
})

local wk = require('which-key')
wk.add({
    { '<C-n>', desc = 'select [N]ext item in the code completion list', mode = 'i' },
    { '<C-p>', desc = 'select [P]revious item in the code completion list', mode = 'i' },
    { '<Tab>', desc = 'confirm code completion option', mode = 'i' },
    { '<C-Space>', desc = 'expand the code completion list' },
})

