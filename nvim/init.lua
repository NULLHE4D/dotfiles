vim.g.mapleader = ' '

-- plugin manager

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- plugins

require('lazy').setup({
    'mbbill/undotree',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {'rose-pine/neovim', name = 'rose-pine'}
})


-- options

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backspace= {'indent', 'eol', 'start'}
vim.opt.autoread = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 6
vim.opt.confirm = true
vim.opt.directory = os.getenv('HOME') .. '/.nvim/swp/'
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undo/'
vim.opt.arabicshape = false
--vim.opt.formatoptions = 'ql'

vim.cmd('colorscheme rose-pine')


-- remaps

-- moving between buffers
vim.keymap.set('n', '<Leader>n', ':bn<CR>')
vim.keymap.set('n', '<Leader>p', ':bp<CR>')

-- copying to system clipboard
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>y', '"+y')

--
vim.keymap.set('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- undotree
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)
