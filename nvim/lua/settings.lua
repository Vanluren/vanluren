-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-- General
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.updatetime = 300 -- Length of time to wait before triggering the plugin
opt.timeoutlen = 300 -- Length of time to wait for a mapped sequence
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.encoding = "utf-8" -- Set encoding to  UTF-8
opt.cursorline = true -- Highlight the current line
opt.signcolumn = "yes" --  Always show the sign colum
opt.laststatus = 3 -- joined status bar

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
	false
)

-- Memory, CPU
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-- Colorscheme
opt.termguicolors = true -- enable 24-bit RGB colors

-- Tabs, indent
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 2 spaces when tab
opt.tabstop = 2 -- 1 tab == 2 spaces
opt.smartindent = true -- autoindent new lines

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- 2 spaces for selected filetypes
-- cmd([[
--   autocmd FileType xml,html,xhtml,css,scss,less,javascript,javascriptreact,typescript,typescriptreact,lua,yaml setlocal shiftwidth=2 tabstop=2
-- ]])

-- Autocompletion
-- insert mode completion options
opt.completeopt = "menuone,noselect"

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
]])

-- Startup
-- disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append("sI")
