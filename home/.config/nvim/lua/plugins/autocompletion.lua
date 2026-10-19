return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    opts = {
        keymap = {
            preset = "enter",
        },

        appearance = {
            -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        completion = {
            -- By default, you may press `<c-space>` to show the documentation.
            -- Optionally, set `auto_show = true` to show the documentation after a delay.
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },

        sources = {
            default = { "lsp", "path" },
        },

        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
