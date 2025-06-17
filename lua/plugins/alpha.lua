return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("n", "📄  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("p", "📁  Projects", ":Telescope projects<CR>"),
      dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = function()
      local stats = require("lazy").stats()
      local v = vim.version()
      return string.format(
        "⚡ Neovim v%d.%d.%d | Loaded %d plugins in %.2fms",
        v.major,
        v.minor,
        v.patch,
        stats.count,
        stats.startuptime
      )
    end

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
}
