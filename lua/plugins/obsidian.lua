return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('obsidian').setup {
        disable_frontmatter = true,

        note_id_func = function(title)
          if title ~= nil then
            return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
          else
            return tostring(os.time())
          end
        end,

        note_path_func = function(spec)
          local path = spec.dir / tostring(spec.id)
          return path:with_suffix '.md'
        end,

        workspaces = {
          {
            name = 'personal',
            path = vim.fn.expand '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/知識の書庫/',
          },
        },
      }
      vim.keymap.set('n', '-s', ':ObsidianQuickSwitch<CR>', { desc = 'open obsidian vault search' })
    end,
  },
}
