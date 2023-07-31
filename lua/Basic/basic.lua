local opt = vim.opt
local cmd = vim.cmd

opt.number = true

-- tabs & indentation
opt.tabstop = 4       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- cursor line
opt.cursorline = true -- highlight cursorline

-- appearance
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
--opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.ignorecase = true               -- ignore case when searching
opt.smartcase = true                -- if you include mixed case in your search, assumes you want case-sensitive

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- opt.relativenumber = true

-- status
opt.laststatus = 2
function MyStatusLine()
    return "[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]"
end

opt.statusline = MyStatusLine()
cmd(vim.cmd('autocmd BufRead,BufNewFile *.v set filetype=verilog'))

-- opt.foldmethod=expr
-- opt.foldexpr=nvim_treesitter#foldexpr()
