-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'thedenisnikulin/vim-cyberpunk', 
		as = 'cyberpunk',
		config = function()
			vim.cmd('colorscheme cyberpunk')
		end
	}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    
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
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    }

    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')

end)
