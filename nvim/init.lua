-- bootstrap basic stuff
require("boot")

-- NOTE: Specify here the modules that should be loaded
local modules_to_load = {
	"editing",
	"git",
	"help",
	"telescope",
	"lsp",
	"completion",
	"theme",
	"mini",
	"syntax_highlight",
	"clojure",
}

local opts = {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

-- modules loading
local c = require("common")
local modules = c.map(c.prepend("modules"), modules_to_load)

require("modules_loader").load(modules, opts)
