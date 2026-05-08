-- =====================================================================
-- init.lua — Neovim configuration entry point
-- =====================================================================
--
-- What is Kickstart?
--
--   Kickstart.nvim is *not* a distribution.
--   Kickstart.nvim is a starting point for your own configuration.
--
-- Structure of this config:
--
--   init.lua                  ← you are here (entry point)
--   lua/
--     config/
--       options.lua           ← vim settings, leaders, diagnostic config
--       keymaps.lua           ← basic keymaps
--       autocmds.lua          ← basic autocommands
--     plugins/
--       build.lua             ← vim.pack build hooks (must load before plugins)
--       ui.lua                ← colorscheme, statusline, which-key, mini.nvim, …
--       telescope.lua         ← fuzzy finder + LSP pickers
--       lsp.lua               ← language servers, mason, fidget
--       formatting.lua        ← conform.nvim
--       completion.lua        ← blink.cmp + LuaSnip
--       treesitter.lua        ← syntax highlighting & indentation
--     kickstart/
--       health.lua            ← :checkhealth support
--       plugins/              ← optional example plugins (uncomment below)
--     custom/
--       plugins/              ← your own plugins (add files here)
--
-- If you don't know anything about Lua, I recommend taking some time to read through
-- a guide. One possible example which will only take 10-15 minutes:
--   https://learnxinyminutes.com/docs/lua/
--
-- After understanding a bit more about Lua, you can use `:help lua-guide` as a
-- reference for how Neovim integrates Lua.
--
-- If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

-- =====================================================================
-- FOUNDATION
-- Must load first — sets leader keys and core options before plugins.
-- =====================================================================
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

-- =====================================================================
-- PLUGIN MANAGER
-- Build hooks must be registered before any vim.pack.add calls.
-- =====================================================================
require 'plugins.build'

-- =====================================================================
-- PLUGINS
-- =====================================================================
require 'plugins.ui'
require 'plugins.telescope'
require 'plugins.lsp'
require 'plugins.formatting'
require 'plugins.completion'
require 'plugins.treesitter'

-- =====================================================================
-- OPTIONAL PLUGINS
-- The following are example plugins included in the kickstart repository.
-- Uncomment any of the lines below to enable them (restart nvim after).
-- =====================================================================
-- require 'kickstart.plugins.debug'
-- require 'kickstart.plugins.indent_line'
-- require 'kickstart.plugins.lint'
-- require 'kickstart.plugins.autopairs'
-- require 'kickstart.plugins.neo-tree'
-- require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps

-- =====================================================================
-- CUSTOM PLUGINS
-- Add your own plugins to lua/custom/plugins/*.lua and uncomment below.
-- =====================================================================
require 'custom.plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
