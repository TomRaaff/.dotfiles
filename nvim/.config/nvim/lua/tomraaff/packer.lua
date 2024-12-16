--remap This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = {
          {'nvim-lua/plenary.nvim'} ,
          {'burntsushi/ripgrep'},
      }
  }

  -- undo
  use('mbbill/undotree')

  -- git
  use('tpope/vim-fugitive')
  use{'sindrets/diffview.nvim'}

  -- LSP
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  -- Markdown support
  use({
      'MeanderingProgrammer/render-markdown.nvim',
      after = { 'nvim-treesitter' },
      requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
      -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
      -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({})
      end,
  })

  -- File system
  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
      },
  }

  -- Auto save
  use {
    "pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            -- enter config
        }
    end
  }

  -- Window management
  --------------------
  -- Splits management
  use('mrjones2014/smart-splits.nvim')
  -- Tmux bindings
  -- use('christoomey/vim-tmux-navigator')
 
  -- Visuals
  ----------
  -- Theme
  use "folke/tokyonight.nvim"

  -- Statusbar 
  use('nvim-lualine/lualine.nvim')

  -- Smoothscrolling
  use('karb94/neoscroll.nvim')

  -- Highlighting
  -- highlights the cursurline
  use {
      'yamatsum/nvim-cursorline',
      config = function()
          require('nvim-cursorline').setup {
              cursorline = {
                  enable = true,
                  timeout = 200,
                  number = true,
              },
              cursorword = {
                  enable = true,
                  min_length = 3,
                  hl = { underline = true },
              }
          }
      end
  }
  -- subdue splits that are out-of-focus
  use {
      'miversen33/sunglasses.nvim',
      config = function()
          require('sunglasses').setup {
              filter_type = "SHADE",
              filter_percent = .25
          }
      end
  }

  -- Keybinding help
  use {'folke/which-key.nvim'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
