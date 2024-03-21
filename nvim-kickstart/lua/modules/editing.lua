-- default indenting settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

return {
	{
		"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	},
	{
		"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
		opts = {},
	},
	{
		"cappyzawa/trim.nvim",
		config = function()
			require("trim").setup({
				ft_blocklist = { "markdown" },
			})
		end,
	},
	{
		"stevearc/conform.nvim", -- Autoformat

		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},
}
