local background = vim.opt.background:get()

return require("lualine.themes.dim_" .. background)
