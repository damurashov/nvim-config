vim.cmd([[
	set noexpandtab shiftwidth=4 tabstop=4
	syntax on
	set ignorecase
	set number
	colorscheme desert
	xnoremap :X "+y
]])
vim.g.rust_recommended_style = 0
vim.g.python_recommended_style = 0
vim.api.nvim_create_user_command("DAwwide", "vertical resize 120", {})  -- Window Widen
vim.api.nvim_create_user_command("DAwt", "tab split", {})  -- Window split into Tab
vim.api.nvim_create_user_command("DAcreload", "source ~/.config/nvim/init.lua", {})  -- Config Reload
vim.api.nvim_create_user_command("DAttabs", "set noexpandtab shiftwidth=4 tabstop=4", {})  -- Text use Tabs
vim.api.nvim_create_user_command("DAtspaces", "set expandtab shiftwidth=4 tabstop=4", {})  -- Text use Spaces
vim.api.nvim_create_user_command("DAptefif", "Telescope find_files", {})  -- Plugin TElescope FInd Files
vim.api.nvim_create_user_command("DApteb", "Telescope buffers", {})  -- Plugin TElescope Buffers
vim.api.nvim_create_user_command("DAttg", "Telescope buffers", {})  -- Text TaGs
vim.api.nvim_set_keymap("n", "-p", ":Telescope find_files <CR>", {})  -- Find files in the current pwd
vim.api.nvim_set_keymap("n", "-g", ":Telescope current_buffer_fuzzy_find <CR>", {})  -- Search for a sequence in the current file using fuzzy search
-- vim.api.nvim_set_keymap("n", "-t", " :lua =win_tab_new() <CR>", {})  -- Open new tab and search for files

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

vim.api.nvim_create_autocmd({"BufWritePre"}, {pattern = {"*"}, callback=text_remove_trailing_whitespace})

require("telescope")  -- Enable plugin "Telescope"
