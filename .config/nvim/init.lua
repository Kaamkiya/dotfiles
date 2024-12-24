require("hardtime").setup()

vim.go.compatible = false
vim.go.lazyredraw = true
vim.go.cmdheight = 1
vim.go.scrolloff = 4
vim.go.wildmenu = true
vim.go.swapfile = false
vim.go.hlsearch = true
vim.go.incsearch = true
vim.go.magic = true

vim.o.number = true
vim.o.cursorline = true
vim.o.wrap = false

vim.cmd.syntax("on")
vim.cmd.filetype("on")
vim.cmd.colorscheme("catppuccin_mocha")

function contains(t, value)
  for i = 1,#t do
    if (t[i] == value) then
      return true
    end
  end
  return false
end

if (contains({"javascript", "javascriptreact", "html", "css", "typescript", "typescriptreact", "java", "astro"}, vim.bo.filetype)) then
    vim.bo.expandtab = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
elseif (contains({"python", "rust", "d", "sh", "zig", "lua"}, vim.bo.filetype)) then
    vim.bo.expandtab = true
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
else
    vim.bo.expandtab = false
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 8
end
