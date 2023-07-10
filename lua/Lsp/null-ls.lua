local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local function is_null_ls_formatting_enabled(bufnr)
    local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local generators = require("null-ls.generators").get_available(
        file_type,
        require("null-ls.methods").internal.FORMATTING
    )
    return #generators > 0
end

function on_attach(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        if
            client.name == "null-ls" and is_null_ls_formatting_enabled(bufnr)
            or client.name ~= "null-ls"
        then
            vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
            vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
        else
            vim.bo[bufnr].formatexpr = nil
        end
    end
end
