local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
    -- dependency stuff
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- git stuff
    use("TimUntersberger/neogit")
    use("lewis6991/gitsigns.nvim")
    use("sindrets/diffview.nvim")

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x"
    })
    use("nvim-telescope/telescope-project.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("jvgrootveld/telescope-zoxide")

    -- lsp
    use("neovim/nvim-lspconfig")
    use("L3MON4D3/LuaSnip")
    use("lukas-reineke/lsp-format.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- filetype specifics
    --- rust
    use("saecki/crates.nvim")
    use("simrat39/rust-tools.nvim")
    --- python
    use("psf/black")

    -- completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/nvim-cmp")

    -- debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- colorschemes
    use("folke/tokyonight.nvim")
    use("morhetz/gruvbox")
    use({ "embark-theme/vim", as = "embark" })
    use({ "dracula/vim", as = "dracula" })

    -- visual stuff
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")
    use("tiagovla/scope.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("folke/which-key.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("lukas-reineke/indent-blankline.nvim")

    use("nvim-treesitter/nvim-treesitter")
    use({ "nvim-treesitter/nvim-treesitter-context",
        config = function() require("treesitter-context").setup() end
    }) -- sticky headers

    -- other
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end
    })
    use("nvim-orgmode/orgmode")
    use("mbbill/undotree")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
