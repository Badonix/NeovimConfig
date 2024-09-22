local status_ok, navigator = pcall(require, "vim-tmux-navigator")
if not status_ok then
	return
end

navigator.setup({})
