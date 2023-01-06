vim.cmd([[
	set noexpandtab shiftwidth=4 tabstop=4
	syntax on
	set ignorecase
	set number
	colorscheme peachpuff
	vnoremap :Y "+y
	nnoremap :Q :q <CR> :tabprevious <CR>
	colorscheme github_light_default
]])
-- vim.g.rust_recommended_style = 0
vim.g.python_recommended_style = 0
vim.api.nvim_create_user_command("DAwwide", "vertical resize 120", {})  -- Window Widen
vim.api.nvim_create_user_command("DAwt", "tab split", {})  -- Window split into Tab
vim.api.nvim_create_user_command("DAwoc", "!code %", {})  -- Window Open in Code
vim.api.nvim_create_user_command("DAcreload", "source ~/.config/nvim/init.lua", {})  -- Config Reload
vim.api.nvim_create_user_command("DAcedit", "tabnew ~/.config/nvim/init.lua", {})  -- Config EDIT
vim.api.nvim_create_user_command("DAttabs", "set noexpandtab shiftwidth=4 tabstop=4", {})  -- Text use Tabs
vim.api.nvim_create_user_command("DAtspaces", "set expandtab shiftwidth=4 tabstop=4", {})  -- Text use Spaces
vim.api.nvim_create_user_command("DAtwrap", "set wrap", {})  -- Text use Spaces
vim.api.nvim_create_user_command("DAtnwrap", "set nowrap", {})  -- Text use Spaces
vim.api.nvim_create_user_command("DAptefif", "Telescope find_files", {})  -- Plugin TElescope FInd Files
vim.api.nvim_create_user_command("DApteb", "Telescope buffers", {})  -- Plugin TElescope Buffers
vim.api.nvim_create_user_command("DAttg", "Telescope buffers", {})  -- Text TaGs
vim.api.nvim_set_keymap("n", "-p", ":Telescope find_files <CR>", {})  -- Find files in the current pwd
vim.api.nvim_set_keymap("n", "-P", ":Telescope buffers <CR>", {})  -- Search among opened buffers
vim.api.nvim_set_keymap("n", "-g", ":Telescope current_buffer_fuzzy_find <CR>", {})  -- Search for a sequence in the current file using fuzzy search
vim.api.nvim_set_keymap("n", "-m", ":Telescope marks <CR>", {})  -- Search for a sequence in the current file using fuzzy search
vim.api.nvim_set_keymap("n", "-G", ":Telescope live_grep <CR>", {})  -- Search among files using fuzzy search
vim.api.nvim_set_keymap("n", "-u", ":lua =config_packer_sync() <CR>", {})  -- Synchronize packer
vim.api.nvim_set_keymap("n", "-c", ":lua =plugin_beefy_require() <CR>", {})
vim.api.nvim_set_keymap("n", "-z", ":lua =window_zoom() <CR>", {})  -- Zoom window fullscreen
vim.g.mapleader = ','
-- vim.api.nvim_set_keymap("n", "-t", " :lua =win_tab_new() <CR>", {})  -- Open new tab and search for files

function config_packer_sync()
	require("packer").startup(
		function(use)
			use 'neovim/nvim-lspconfig'
			use 'simrat39/rust-tools.nvim'
			use 'junegunn/vim-easy-align'
			use 'projekt0n/github-nvim-theme'
			use 'nvim-lua/plenary.nvim'
			use 'mfussenegger/nvim-dap'
			use 'williamboman/mason-lspconfig.nvim'
			use 'williamboman/mason.nvim'

			-- Completion framework:
			use 'hrsh7th/nvim-cmp'

			-- LSP completion source:
			use 'hrsh7th/cmp-nvim-lsp'

			-- Useful completion sources:
			use 'hrsh7th/cmp-nvim-lua'
			use 'hrsh7th/cmp-nvim-lsp-signature-help'
			use 'hrsh7th/cmp-vsnip'
			use 'hrsh7th/cmp-path'
			use 'hrsh7th/cmp-buffer'
			use 'hrsh7th/vim-vsnip'

			use 'nvim-treesitter/nvim-treesitter'
			use 'puremourning/vimspector'
		end
	).sync()
end

function win_tab_new()
	vim.cmd([[
		tabnew
		Telescope find_files
	]])
end

-- Remove trailing whitespaces before saving to file
function text_remove_trailing_whitespace()
	vim.cmd([[:%s/\s\+$//e]])
end

function config_numbering_set_relative()
	vim.cmd([[set relativenumber]])
end

function config_numbering_set_absolute()
	vim.cmd([[set norelativenumber]])
end

vim.api.nvim_create_autocmd({"BufWritePre"}, {pattern = {"*"}, callback=text_remove_trailing_whitespace})

-- if vim.api.exists("g:neovide") then
--	vim.cmd([[colorscheme morning]])
-- end
function plugin_beefy_require()
	print("Beefy enabled")
	require("my_plugins_lsp")
	require("my_plugins_mason")
	require("my_plugins_vimspector")
	require("my_plugins_treesitter")
	require("my_plugins_rust_tools")
	require("my_plugins_completion")
	vim.cmd([[
		set colorcolumn=80
		set colorcolumn+=100
		set colorcolumn+=120
	]])
end

function plugin_default()
	require("my_plugins_telescope")
end

function window_zoom()
	vim.cmd([[
		resize 10000
		vertical resize 10000
	]])
end

vim.cmd [[packadd packer.nvim]]
plugin_default()
config_numbering_set_relative()

