local termguicolors = vim.opt.termguicolors:get()
local colors = require(string.format("dim-colors.colors.dark_%s", termguicolors and "gui" or "cterm"))

return {
    normal = {
        a = { bg = colors.base6, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base4, fg = colors.base7 },
        c = { bg = colors.base3, fg = colors.base7 }
    },
    insert = {
        a = { bg = colors.teal, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.teal },
        c = { bg = colors.base3, fg = colors.base7 }
    },
    visual = {
        a = { bg = colors.blue, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.blue },
        c = { bg = colors.base3, fg = colors.base7 }
    },
    replace = {
        a = { bg = colors.orange, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.orange },
        c = { bg = colors.base3, fg = colors.base7 }
    },
    command = {
        a = { bg = colors.base6, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base7 },
        c = { bg = colors.base3, fg = colors.base7 }
    },
    inactive = {
        a = { bg = colors.base6, fg = colors.base0, gui = "bold" },
        b = { bg = colors.base3, fg = colors.base7 },
        c = { bg = colors.base3, fg = colors.base7 }
    }
}
