return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = {
        server = {
            on_attach = function(_, bufnr)
                local rust_tools = require("rust-tools")
                vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                vim.keymap.set("n", "<Leader>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
                rust_tools.inlay_hints.enable()
            end,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        },
        tools = {
            hover_actions = {
                auto_focus = true,
            },
            inlay_hints = {
                auto = false,
            },
        },
        dap = {
            adapter = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            },

        },
    },
}
