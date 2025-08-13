return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters = {
                clang_format = {
                    prepend_args = { "--style=file", "--assume-filename=" .. os.getenv("HOME") .. "/.clang-format" },
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                go = { "goimports", "gofmt" },
                cpp = { "clang_format" },
                c = { "clang_format" },
            },
        })
    end
}
