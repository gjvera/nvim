local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

vim.lsp.config('tailwindcss', {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { 
    "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", 
    "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", 
    "handlebars", "hbs", "html", "html-eex", "jade", "leaf", 
    "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", 
    "php", "razor", "slim", "twig", "css", "less", "postcss", 
    "sass", "scss", "stylus", "sugarss", "javascript", 
    "javascriptreact", "reason", "rescript", "typescript", 
    "typescriptreact", "vue", "svelte" 
  },
  root_markers = { 
    'tailwind.config.js', 
    'tailwind.config.ts', 
    'postcss.config.js', 
    'package.json', 
    '.git' 
  },
  handlers = handlers,
  capabilities = capabilities,
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb"
    }
  },
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          "tw=\"([^\"]*)",
          "tw={\"([^\"}]*)",
          "tw\\.\\w+`([^`]*)",
          "tw\\(.*?\\)`([^`]*)"
        }
      },
      validate = true
    }
  }
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if client and client.name == "tailwindcss" then
      client.config.settings.tailwindCSS.editor = {
        tabSize = vim.bo[bufnr].tabstop
      }

      if client.supports_method("textDocument/documentColor") then
        local has_colors, doc_colors = pcall(require, "lsp/documentcolors")
        if has_colors then
            doc_colors.buf_attach(bufnr)
        end
      end
    end
  end,
})

vim.lsp.enable('tailwindcss')
