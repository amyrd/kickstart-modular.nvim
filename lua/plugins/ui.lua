return {
  {
    'goolord/alpha-nvim', -- Dashboard
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha.themes.dashboard').section.footer.val = require 'alpha.fortune'()
      require('alpha').setup(require('alpha.themes.dashboard').opts)
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[  ██████   █████                   █████   █████  ███                  ]],
        [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
        [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
        [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
        [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
        [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
        [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
        [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
        [[                                                                       ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', ' Find file', ':Telescope find_files hidden=true no_ignore=true<CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
        dashboard.button('u', '  Update plugins', ':Lazy sync<CR>'),
        dashboard.button('r', ' Recently opened files', '<cmd>Telescope oldfiles<CR>'),
        dashboard.button('q', '󰩈 Quit', ':qa<CR>'),
      }

      local handle, err = io.popen 'fortune -s'
      if err or handle == nil then
        dashboard.section.footer.val = 'May the truth be found.'
        alpha.setup(dashboard.opts)
        return
      end
      local fortune = handle:read '*a'
      handle:close()
      alpha.setup(dashboard.opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
