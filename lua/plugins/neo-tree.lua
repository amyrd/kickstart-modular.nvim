return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    config = function()
      require('neo-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        autochdir = true,
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        filesystem = {
          window = {
            mappings = {
              ['\\'] = 'close_window',
            },
          },
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- updated to the correct repository for the icons
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    },
  },
}
