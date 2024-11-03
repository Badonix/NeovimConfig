local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- autocompletion
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
	})

	use("windwp/nvim-autopairs")

	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("andweeb/presence.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use("nvim-lualine/lualine.nvim")

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	use("nvimtools/none-ls.nvim")
	use("windwp/nvim-ts-autotag")
	use("christoomey/vim-tmux-navigator")

	use("nyoom-engineering/oxocarbon.nvim")
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("rafi/awesome-vim-colorschemes")
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				palettes = {
					-- Custom duskfox with black background
					nordfox = {
						bg1 = "#000000", -- Black background
						bg0 = "#000000", -- Alt backgrounds (floats, statusline, ...)
						bg3 = "#000000", -- 55% darkened from stock
						sel0 = "#121820", -- 55% darkened from stock
					},
				},
				specs = {
					all = {
						inactive = "bg0", -- Default value for other styles
					},
					duskfox = {
						inactive = "#090909", -- Slightly lighter then black background
					},
				},
				groups = {
					all = {
						NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
					},
				},
			})
			vim.cmd("colorscheme nordfox")
		end,
	})

	use({ "rebelot/kanagawa.nvim" })
	-- Automatically set up your configuration after cloning packer.nvim
	--

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
