local termguicolors = vim.opt.termguicolors:get()
local colors = require(string.format("dim-colors.colors.light_%s", termguicolors and "gui" or "cterm"))

return {
    normal = {
        a = { bg = colors.base5, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base6 },
        c = { bg = colors.base3, fg = colors.base6 }
    },
    insert = {
        a = { bg = colors.teal, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base6 },
        c = { bg = colors.base3, fg = colors.base6 }
    },
    visual = {
        a = { bg = colors.blue, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base6 },
        c = { bg = colors.base3, fg = colors.base6 }
    },
    replace = {
        a = { bg = colors.brown, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.brown },
        c = { bg = colors.base3, fg = colors.base6 }
    },
    command = {
        a = { bg = colors.base5, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base6 },
        c = { bg = colors.base3, fg = colors.base6 }
    },
    inactive = {
        a = { bg = colors.base5, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base6 },
        c = { bg = colors.base3, fg = colors.base6 }
    }
}
