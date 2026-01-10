require("editor")
 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
     "git",
     "clone",
     "--filter=blob:none",
     "https://github.com/folke/lazy.nvim.git",
     "--branch=stable", -- latest stable release
     lazypath,
   })
 end
 vim.opt.rtp:prepend(lazypath)
 require("lazy").setup(require("plugins"), opts)
 vim.g.mapleader = ","
local uname = vim.uv.os_uname()
local is_arch = string.find(string.lower(uname.release), "arch") or 
                string.find(string.lower(uname.version), "arch")

-- arch defaults the system register to + and muscle memory for me needs it to be *
if is_arch then
    vim.g.clipboard = {
      name = 'wl-clipboard',
      copy = {
         ["*"] = 'wl-copy',
       },
      paste = {
         ["*"] = 'wl-paste',
      },
      cache_enabled = 1,
    }
end
 require("lsp")
 require("keymaps")
