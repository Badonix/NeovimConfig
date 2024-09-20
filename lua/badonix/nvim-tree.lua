require("nvim-tree").setup({
  git = {
      enable = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "left",
    width = 30,
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
      enable = true,
      auto_open = true,
  },
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.cmd("hi NvimTreeRootFolder guifg=#FFFFFF")
    end,
})

