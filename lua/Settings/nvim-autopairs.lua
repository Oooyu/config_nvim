local Rule = require('nvim-autopairs.rule')
-- local cond = require('nvim-autopairs.conds')
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
-- require("nvim-autopairs").disable("`","",{"systemverilog","verilog"})
