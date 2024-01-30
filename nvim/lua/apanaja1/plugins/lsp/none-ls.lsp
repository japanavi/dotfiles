return {
    "nvimtools/none-ls.nvim",
    local null_ls = require("null-ls")
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
        sources = {
            diagnostics.flake8.with({
                diagnostic_config = {
                    underline = false,
                    virtual_text = false,
                    signs = false,
                    update_in_insert = false,
                    severity_sort = true,
            },
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }),
        }
    })
}
