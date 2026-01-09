-- 1. Simple Server Initialization
-- This replaces lspconfig.setup{} for servers with default settings

require('lsp/servers/tailwind')
local servers = { 'ts_ls', 'gopls' }

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- 2. ESLint with "Fix on Save" Logic
-- We use the native config to define the server and an autocmd for the behavior
vim.lsp.config('eslint', {
  -- If you need specific cmd or root_markers, add them here
  -- otherwise it uses the built-in defaults
})

vim.lsp.enable('eslint')

-- Native replacement for the on_attach block
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      -- EslintFixAll on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        command = "EslintFixAll",
      })
    end
  end,
})

-- 3. nvim-cmp Setup (Remains mostly the same)
-- nvim-cmp doesn't use the deprecated lspconfig framework, so this is safe
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
