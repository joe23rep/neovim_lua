local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
-- My plugins here

  use("wbthomason/packer.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/bufferline.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("windwp/nvim-autopairs")
  use("lukas-reineke/indent-blankline.nvim")
	use("nvim-lualine/lualine.nvim")
  -- use("tomtom/tcomment_vim")
	use("lewis6991/impatient.nvim")
	use("lewis6991/gitsigns.nvim")
	use("mvllow/modes.nvim")
	use("rainbowhxch/beacon.nvim")
	use("folke/which-key.nvim")
	use("goolord/alpha-nvim")
	use("vimwiki/vimwiki")
	use("kevinhwang91/rnvimr")
  use("numToStr/Comment.nvim")

-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

--LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  -- use("jose-elias-alvarez/null-ls.nvim")

-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

-- toggleterm
	use("akinsho/toggleterm.nvim")

-- mind
  use {
  'phaazon/mind.nvim',
  branch = 'v2',
  requires = { 'nvim-lua/plenary.nvim' },
  configure = function()
   require'mind'.setup()
  end
  }
-- telescope
	use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
	use("nvim-telescope/telescope-file-browser.nvim")

-- persistence
  use({
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  config = function()
    require("persistence").setup()
  end,
  })

-- color stuff like themes or tools regarding colors
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")
  use("p00f/nvim-ts-rainbow")
	use({ "joe23rep/colorscheme", as = "catppuccin"})
	use("NvChad/nvim-colorizer.lua")
  use {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
  end,
  }

-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

