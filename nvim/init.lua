-- Editor e visualizador leve para o terminal. Sem LSP, sem completion engine.
-- Atualizar plugins: :lua vim.pack.update()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opções
local o = vim.opt

o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"
o.showmode = false
o.ruler = false
o.scrolloff = 10
o.winborder = "rounded"

o.linebreak = true
o.breakindent = true

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

o.mouse = "a"
o.clipboard = "unnamedplus"
o.undofile = true
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.timeoutlen = 300

-- Plugins
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-mini/mini.nvim",
}, { confirm = false })

require("tokyonight").setup({ style = "moon" })
vim.cmd.colorscheme("tokyonight")

require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.diff").setup({ view = { style = "sign" } })
require("mini.files").setup()
require("mini.pick").setup()

-- Atalhos
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-h>", "<C-w><C-h>", { desc = "Janela à esquerda" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Janela abaixo" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Janela acima" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Janela à direita" })

map("n", "<leader>f", MiniPick.builtin.files, { desc = "Buscar arquivos" })
map("n", "<leader>g", MiniPick.builtin.grep_live, { desc = "Buscar no conteúdo" })
map("n", "<leader>b", MiniPick.builtin.buffers, { desc = "Buffers abertos" })
map("n", "<leader>e", function()
  local file = vim.api.nvim_buf_get_name(0)
  MiniFiles.open(vim.uv.fs_stat(file) and file or nil)
end, { desc = "Explorador de arquivos" })

-- Destaca o trecho copiado
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})
