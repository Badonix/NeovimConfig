require("badonix.options")
require("badonix.lualine")
require("badonix.keymaps")
require("badonix.plugins")
require("badonix.colorscheme")
require("badonix.cmp")
require("badonix.lsp")
require("badonix.telescope")
require("badonix.treesitter")
require("badonix.autopairs")
require("badonix.comment")
require("badonix.presence")
--[[ require("badonix.gitsigns") ]]
require("badonix.nvim-tree")
--[[ require("badonix.bufferline") ]]
require("badonix.nvim-ts-autotag")
require("badonix.vim-tmux-navigator")
require("badonix.harpoon")
vim.cmd([[
  highlight NvimTreeNormal guibg=NONE
]])
vim.cmd("highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE")
