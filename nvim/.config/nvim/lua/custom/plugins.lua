local plugins = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
    config = function ()
      require("nvim-tree").setup {
        on_attach = function (bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set('n', 'd', api.fs.trash, opts("Trash"))
        end
      }
    end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "windwp/nvim-ts-autotag" },
		},
		opts = {
			indent = { enable = true },
			autotag = { enable = true, enable_rename = true },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				vue = { "prettier" },
				go = { "gofmt", "golines", "goimports" },
				rust = { "rustfmt" },
			},
			formatters = {
				rustfmt = {
					command = "cargo",
					args = { "fmt", "--", "--emit=stdout" },
				},
			},
		},
	},
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        rgb_fn = true,
        hsl_fn = true,
      }
    }
  }
}

return plugins
