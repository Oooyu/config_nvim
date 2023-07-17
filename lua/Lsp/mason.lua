require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:

    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
    ["svlangserver"] = function()
        require("lspconfig").svlangserver.setup {
            settings = {
                includeIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}", "**/*/.*{v,vh,sv,svh}" }
            },
            single_file_support = true,
        }
    end
}

require("mason-null-ls").setup({
    handlers = {},
})
