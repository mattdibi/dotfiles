--[[ Notes to people reading my configuration!

Much of the configuration of individual plugins you can find in either:

./after/plugin/*
  This is where configuration for lua plugins live.
  They get auto sourced on startup. In general, the name of the file configures
  the plugin with the corresponding name.

./lua/mattdibi/*.lua
  This is where configuration/extensions for new style plugins live.
  They don't get sourced automatically, but do get sourced by doing something like:
    require('mattdibi.dap')
  or similar. I generally recommend that people do this so that you don't accidentally
  override any of the plugin requires with namespace clashes. So don't just put your configuration
  in "./lua/dap.lua" because then it will override the plugin version of "dap.lua"

--]]

require('mattdibi')

