return {
    "folke/snacks.nvim",

    opts = {
        picker = {
            layout = {
                preset = "telescope", -- as you mentioned
                layout = {
                    width = 0.9,
                    height = 0.9,
                },
                preview = {
                    width = 0.65, -- increase preview (default ~0.5)
                },
            },
        },
    },

    config = function(_, opts)
        local Snacks = require("snacks")
        Snacks.setup(opts)

        local picker = Snacks.picker

        -- ========================
        -- YOUR ORIGINAL KEYMAPS
        -- ========================

        vim.keymap.set('n', '<leader>pf', function()
            picker.files()
        end, { desc = 'Find files' })

        vim.keymap.set('n', '<leader>ps', function()
            picker.grep({
                regex = false, -- 🔥 FIX: treat input as literal
            })
        end, { desc = 'Live grep' })

        vim.keymap.set('n', '<leader>pb', function()
            picker.buffers()
        end, { desc = 'Buffers' })

        vim.keymap.set('n', '<leader>ph', function()
            picker.help()
        end, { desc = 'Help tags' })

        vim.keymap.set('n', '<leader>pg', function()
            picker.git_files()
        end, { desc = 'Git files' })

        -- current word (literal search)
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            picker.grep({
                search = word,
                regex = false,
            })
        end)

        -- WORD (literal search)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            picker.grep({
                search = word,
                regex = false,
            })
        end)

        -- visual selection (literal search)
        vim.keymap.set('v', '<leader>pvs', function()
            vim.cmd('normal! "zy')
            local selected_text = vim.fn.getreg('z')
            picker.grep({
                search = selected_text,
                regex = false,
            })
        end, { desc = "Search selected text across files" })

        -- ========================
        -- USEFUL ADDITIONS (from example)
        -- ========================

        -- recent files
        vim.keymap.set('n', '<leader>pr', function()
            picker.recent()
        end, { desc = "Recent files" })

        -- project search (smart)
        vim.keymap.set('n', '<leader><space>', function()
            picker.smart()
        end, { desc = "Smart find files" })

        -- grep current buffer
        vim.keymap.set('n', '<leader>p/', function()
            picker.lines()
        end, { desc = "Search in buffer" })

        -- resume last search
        vim.keymap.set('n', '<leader>pR', function()
            picker.resume()
        end, { desc = "Resume last picker" })

        -- diagnostics
        vim.keymap.set('n', '<leader>pd', function()
            picker.diagnostics()
        end, { desc = "Diagnostics" })
    end
}
