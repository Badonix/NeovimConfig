local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	highlights = {
		fill = {
			guibg = "#282c34", -- Set the background to transparent
		},
	},
})
vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight BufferLineFill guibg=none
autocmd ColorScheme * highlight BufferLineSeparator guifg=none
autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=none
augroup END
]])
