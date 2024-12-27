return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }, -- Optional icons plugin
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', {
            'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
              error = 'DiagnosticError', -- Highlight group for errors
              warn  = 'DiagnosticWarn',  -- Highlight group for warnings
              info  = 'DiagnosticInfo',   -- Highlight group for information
              hint  = 'DiagnosticHint',    -- Highlight group for hints
            },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, -- Custom symbols
          }},
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = { 'buffers' },  -- Show buffer names
          lualine_b = { 'branch' },    -- Show the current branch
          lualine_c = {},               -- Can be empty or have more items
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'tabs' },       -- Show tabs
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}

