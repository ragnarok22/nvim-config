-- Plugin: SergioRibera/codeshot.nvim
-- Installed via store.nvim

return {
    "SergioRibera/codeshot.nvim",
    config = function()
        require("codeshot").setup(
            {}
        )
    end,
    event = "VeryLazy"
}