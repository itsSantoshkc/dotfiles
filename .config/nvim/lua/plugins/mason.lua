return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- 1. Capabilities still work the same way
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 2. Define your list of servers
			local servers = { 
				"html", 
				"lua_ls", 
				"pylsp", 
				"ts_ls", 
				"tailwindcss", 
				"gopls" 
			}

			-- 3. Use the new vim.lsp.config API
			-- This replaces the old lspconfig.server.setup()
			for _, lsp in ipairs(servers) do
				vim.lsp.config(lsp, {
					capabilities = capabilities,
				})
			end

			-- 4. Keymaps (It is often better to use an LspAttach autocmd, 
			-- but keeping your style here for simplicity)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
