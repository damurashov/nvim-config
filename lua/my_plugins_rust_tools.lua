function config_setup_rust_tools()
	local rt = require("rust-tools")

	rt.setup({
	  server = {
		on_attach = function(_, bufnr)
		  -- Hover actions
		  vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, { buffer = bufnr })
		  -- Code action groups
		  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	  },
	})
end

config_setup_rust_tools()

