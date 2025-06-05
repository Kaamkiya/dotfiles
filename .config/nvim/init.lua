--- NEOVIM CONFIG ---
-- Kaamkiya's neovim config
-- URL: https://codeberg.org/Kaamkiya/dotfiles

--- lazy.nvim ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", lazy = false },
    { "echasnovski/mini-git", version = false, main = "mini.git", opts = {} },
    { "echasnovski/mini.pairs", version = false, opts = {} },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local dash = require("alpha.themes.dashboard")

        dash.section.header.val = {
          [[          __________-------____                 ____-------__________  ]],
          [[          \------____-------___--__---------__--___-------____------/  ]],
          [[           \//////// / / / / / \   _-------_   / \ \ \ \ \ \\\\\\\\/   ]],
          [[             \////-/-/------/_/_| /___   ___\\ |_\_\------\-\-\\\\/    ]],
          [[               --//// / /  /  //|| (O)\\ /(O) ||\\  \  \ \ \\\\--      ]],
          [[                    ---__/  // /| \\_  /V\\  _/ |\ \\  \__---          ]],
          [[                         -//  / /\_ ------- _/\ \  \\-                 ]],
          [[                           \_/_/ /\---------/\ \_\_/                   ]],
          [[                               ----\\   |   /----                      ]],
          [[                                    | -|- |                            ]],
          [[                                   /   |   \                           ]],
          [[                                   ---- \___|                          ]],
        }

        dash.section.buttons.val = {
          dash.button("e", "  New file",     [[<cmd>ene <cr>]]),
          dash.button("f", "  Find file",    [[<cmd>Telescope find_files <cr>]]),
          dash.button("r", "  Recent files", [[<cmd>Telescope oldfiles <cr>]]),
          dash.button("q", "  Quit",         [[<cmd>qa <cr>]]),
        }

        require("alpha").setup(dash.config)
      end,
    },
    { "m4xshen/hardtime.nvim", opts = {} },
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "gopls",
          "ruff",
          "rust_analyzer",
        },
      },
    },
    { "neovim/nvim-lspconfig" },
    { "nvim-lualine/lualine.nvim", lazy = false },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "saghen/blink.cmp",
      dependencies = { "rafamadriz/friendly-snippets" },
      version = "1.*",
      opts = {
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        keymap = { preset = "enter" },
        appearance = {
          nerd_font_variant = "mono"
        },
        completion = { documentation = { auto_show = true } },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
      opts = {},
    },
  },
  checker = { enabled = true },
})

--- GENERAL ---

vim.o.number = true
vim.o.relativenumber = true

vim.o.swapfile = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.termguicolors = true
vim.cmd("colo catppuccin-mocha")

vim.o.clipboard = "unnamedplus"

vim.o.scrolloff = 5

vim.o.hlsearch = true
vim.o.incsearch = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- LUALINE ---

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

--- LANGUAGE SERVERS ---

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
vim.diagnostic.open_float()

--- NVIM-TREESITTER ---
require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "python", "typescript", "html", "c", "lua" },
  highlight = { enable = true },
})
