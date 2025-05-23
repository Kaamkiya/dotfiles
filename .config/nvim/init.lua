--- NEOVIM CONFIG ---
-- Kaamkiya's neovim config
-- URL: https://codeberg.org/Kaamkiya/dotfiles

--- MINI.NVIM ---

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd("echo 'Installing `mini.nvim`' | redraw")
  local clone_cmd = {
    "git", "clone", "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim", mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd("echo 'Installed `mini.nvim`' | redraw")
end

local mdeps = require("mini.deps")
mdeps.setup({ path = { package = path_package } })
mdeps.add("echasnovski/mini-git")
mdeps.add("echasnovski/mini.pairs")
mdeps.add("folke/which-key.nvim")
mdeps.add("goolord/alpha-nvim")
mdeps.add("m4xshen/hardtime.nvim")
mdeps.add("mason-org/mason.nvim")
mdeps.add("mason-org/mason-lspconfig.nvim")
mdeps.add("neovim/nvim-lspconfig")
mdeps.add("nvim-lualine/lualine.nvim")
mdeps.add("nvim-tree/nvim-web-devicons")
mdeps.add({ source = "catppuccin/nvim", name = "catppuccin" })
mdeps.add({ source = "nvim-telescope/telescope.nvim", depends = { "nvim-lua/plenary.nvim" } })
mdeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "master",
  monitor = "main",
  hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
})
mdeps.add({
  source = "saghen/blink.cmp",
  depends = { "rafamadriz/friendly-snippets" },
})

mdeps.now(function() require("mini.git").setup({}) end)
mdeps.now(function() require("mini.pairs").setup({}) end)

--- GENERAL ---

mdeps.now(function()
  vim.cmd("colo catppuccin-mocha")
  vim.o.number = true
  vim.o.swapfile = false
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.termguicolors = true
  vim.o.clipboard = "unnamedplus"
  vim.o.scrolloff = 5
  vim.o.hlsearch = true
  vim.o.incsearch = true

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end)

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

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
    "gofumpt",
    "golangci-lint",
    "golangci-lint-langserver",
    "html-lsp",
    "ruff",
    "rust_analyzer"
  },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}
)
vim.diagnostic.open_float()

--- WHICH-KEY ---
mdeps.now(function() require("which-key").setup({}) end)

--- ALPHA ---
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
  dash.button("f", "  Find file",    [[<cmd>lua require("telescope.builtin").find_files() <cr>]]),
  dash.button("r", "  Recent files", [[<cmd>lua require("telescope.builtin").oldfiles() <cr>]]),
  dash.button("q", "  Quit",         [[<cmd>qa <cr>]])
}

require("alpha").setup(dash.config)

--- HARDTIME.NVIM ---
mdeps.now(function() require("hardtime").setup({}) end)

--- NVIM-TREESITTER ---
mdeps.later(function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "go", "python", "typescript", "html", "c", "lua" },
    highlight = { enable = true },
  })
end)
