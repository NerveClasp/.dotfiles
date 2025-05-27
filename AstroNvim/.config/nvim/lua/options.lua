local opt = vim.opt

opt.colorcolumn = "80"
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd("Filetype", { pattern = "rust", command = "set colorcolumn=100" })
opt.cursorcolumn = true
opt.cursorline = true
opt.cursorlineopt = "screenline"
-- opt.updatetime = 250

opt.list = true
opt.listchars = {
  -- eol = "↲",
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
}
opt.swapfile = false
opt.backup = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 50
-- borrowed from ThePrimeagen github.com/ThePrimeagen/init.lua
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- borrowed from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.lua
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append "iwhite"
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append "algorithm:histogram"
vim.opt.diffopt:append "indent-heuristic"
-- show more hidden characters
-- also, show tabs nicer
-- vim.opt.listchars = "tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•"
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })

-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs { "text", "markdown", "mail", "gitcommit" } do
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = pat,
    group = text,
    command = "setlocal spell tw=72 colorcolumn=73",
  })
end
