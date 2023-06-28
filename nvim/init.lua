require("options")
local c = require("common")

-- you should add the modules to be loaded here

local modules_to_load = {
  'editing',
  'telescope',
  'theme',
  'syntax_highlight',
  'completion',
  'lsp',
  'clojure'
}

-- modules loading

local modules_loader = require("modules_loader")
local modules = c.map(c.prepend("modules"), modules_to_load)

modules_loader.load(modules)
