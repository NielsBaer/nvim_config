return {
  'L3MON4D3/LuaSnip',

  version = 'v2.*',

  enable_autosnippets = true,

  store_selection_keys = '<Tab>',

  require('luasnip.loaders.from_lua').lazy_load { paths = '~/.config/nvim/LuaSnip/' },

  config = function()
    local ls = require 'luasnip'
    vim.keymap.set({ 'i' }, '<C-j>', function()
      if ls.expandable() then
        ls.expand()
      elseif ls.jumpable(1) then
        ls.jump(1)
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      ls.jump(-1)
    end, { silent = true })
  end,
}
