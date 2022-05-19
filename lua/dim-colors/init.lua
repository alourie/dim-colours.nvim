local M = {}

local config = {
    extensions = { "treesitter" }
}


M.setup = function(options)
    local available_extensions = { "treesitter", "vimtex-minimal" }

    local contains = function(table, element)
        for _, value in pairs(table) do
            if value == element then
                return true
            end
        end
        return false
    end

    if options == nil then return end

    if options.background ~= nil and (options.background == "light" or options.background == "dark") then
        config.background = options.background
    end

    if options.extensions ~= nil then
        config.extensions = {}
        for _, extension_name in ipairs(options.extensions) do
            if contains(available_extensions, extension_name) then
                table.insert(config.extensions, extension_name)
            end
        end
    end
end

M.colorscheme = function()
    local background = config.background or vim.opt.background:get()
    local termguicolors = vim.opt.termguicolors:get()
    local colors = require(string.format("dim-colors.colors.%s_%s", background, termguicolors and "gui" or "cterm"))

    local link_highlight_groups = function(links)
        for source_group, target_group in pairs(links) do
            vim.cmd(string.format("highlight! link %s %s", source_group, target_group))
        end
    end

    local set_highlight_groups
    if termguicolors then
        set_highlight_groups = function(groups)
            for group_name, group_definition in pairs(groups) do
                vim.api.nvim_set_hl(0, group_name, {
                    fg = colors[group_definition.fg],
                    bg = colors[group_definition.bg],
                    bold = group_definition.bold,
                    italic = group_definition.italic,
                    undercurl = group_definition.undercurl,
                    strikethrough = group_definition.strikethrough,
                    underline = group_definition.underline
                })
            end
        end
    else
        set_highlight_groups = function(groups)
            for group_name, group_definition in pairs(groups) do
                vim.api.nvim_set_hl(0, group_name, {
                    ctermfg = colors[group_definition.fg],
                    ctermbg = colors[group_definition.bg],
                    bold = group_definition.bold,
                    italic = group_definition.italic,
                    undercurl = group_definition.undercurl,
                    strikethrough = group_definition.strikethrough,
                    underline = group_definition.underline
                })
            end
        end
    end

    local base_highlight_groups = require("dim-colors.base." .. background)
    local base_highlight_links = require("dim-colors.base.links")
    set_highlight_groups(base_highlight_groups)
    link_highlight_groups(base_highlight_links)

    for _, extension_name in ipairs(config.extensions) do
        local extension_highlight_groups = require(string.format("dim-colors.extensions.%s.%s", extension_name, background))
        local extension_highlight_links = require(string.format("dim-colors.extensions.%s.links", extension_name))
        set_highlight_groups(extension_highlight_groups)
        link_highlight_groups(extension_highlight_links)
    end
end

return M
