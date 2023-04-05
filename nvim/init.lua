local common = require("common")
local modules_loader = require("modules_loader")

local modules = {"telescope"}

modules_loader.load(common.map(common.prepend("modules"), modules))
