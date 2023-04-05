require("options")
local c = require("common")

-- you should add the modules to be loaded here

local modules_to_load = {"telescope"}

-- modules loading

local modules_loader = require("modules_loader")
local modules = c.map(c.prepend("modules"), modules_to_load)

modules_loader.load(modules)
modules_loader.setup(modules)
