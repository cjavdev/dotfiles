return {
	{ "echasnovski/mini.pairs", enabled = false },
	{ "tpope/vim-rails" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "ruby" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
		config = function()
			vim.filetype.add({
				extension = {
					yml = "yaml",
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			vim.print("setting up dashboard")
			require("dashboard").setup({
				-- theme = "doom",
				-- config = {
				-- header = {
				-- 	"                    AAAAAAAAAAAAAA          AAAAAAAAAAAAAAAAAA         ",
				-- 	"                 AAAAAAAAAAAAAAAAAAAA       AAAAAAAAAAAAAAAAAAA        ",
				-- 	"               AAAAAAAAAAAAAAAAAAAAAAAA     AAAAAAAAAAAAAAAAAAA        ",
				-- 	"             AAAAAAAAAAAAAAAAAAAAAAAAAA     AAAAAAAAAAAAAAAAAAA        ",
				-- 	"             AAAAAAAAAAAAA   AAAAAAAA                AAAAAAAAAA        ",
				-- 	"            AAAAAAAAAAA         AAA                  AAAAAAAAAA        ",
				-- 	"            AAAAAAAAAA                               AAAAAAAAAA        ",
				-- 	"           AAAAAAAAAA                                AAAAAAAAAA        ",
				-- 	"           AAAAAAAAAA                                AAAAAAAAAA        ",
				-- 	"            AAAAAAAAAA          AA                   AAAAAAAAAA        ",
				-- 	"            AAAAAAAAAAAA      AAAAAA        AAA     AAAAAAAAAA         ",
				-- 	"             AAAAAAAAAAAAAAAAAAAAAAAAA     AAAAAAAAAAAAAAAAAAA         ",
				-- 	"              AAAAAAAAAAAAAAAAAAAAAAAAA  AAAAAAAAAAAAAAAAAAAAA         ",
				-- 	"                AAAAAAAAAAAAAAAAAAAAA    AAAAAAAAAAAAAAAAAAA           ",
				-- 	"                  AAAAAAAAAAAAAAAAA        AAAAAAAAAAAAAAAA            ",
				-- 	"                       AAAAAAAA                AAAAAAAA                ",
				-- 	"                                                                       ",
				-- 	"                                                                       ",
				-- 	"                    AAAAAAAAAAA    AAAAAAAAAAA          AAAAAAAAAA     ",
				-- 	"                   AAAAAAAAAAAA     AAAAAAAAAAA        AAAAAAAAAA      ",
				-- 	"                   AAAAAAAAAAAAA     AAAAAAAAAA       AAAAAAAAAA       ",
				-- 	"                  AAAAAAAAAAAAAAA     AAAAAAAAAA      AAAAAAAAA        ",
				-- 	"                 AAAAAAAAAAAAAAAAA    AAAAAAAAAAA    AAAAAAAAA         ",
				-- 	"                AAAAAAAAAAAAAAAAAA     AAAAAAAAAAA  AAAAAAAAAA         ",
				-- 	"               AAAAAAAAA  AAAAAAAAAA    AAAAAAAAAA AAAAAAAAAA          ",
				-- 	"              AAAAAAAAAA   AAAAAAAAA     AAAAAAAAAAAAAAAAAAA           ",
				-- 	"             AAAAAAAAAA     AAAAAAAAA     AAAAAAAAAAAAAAAAA            ",
				-- 	"             AAAAAAAAA      AAAAAAAAAA    AAAAAAAAAAAAAAAAA            ",
				-- 	"            AAAAAAAAA        AAAAAAAAAA    AAAAAAAAAAAAAAA             ",
				-- 	"           AAAAAAAAAA         AAAAAAAAAA    AAAAAAAAAAAAA              ",
				-- 	"          AAAAAAAAAA          AAAAAAAAAA     AAAAAAAAAAA               ",
				-- 	"          AAAAAAAAA            AAAAAAAAAA    AAAAAAAAAAA               ",
				-- },
				-- },
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "neovim_sticky" -- or "vimux", "dispatch", etc.

			-- Test commands
			vim.api.nvim_set_keymap("n", "<Leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>h", ":TestNearest<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>a", ":TestFile<CR>", { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<Leader>f", ":TestSuite<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"cjavdev/night-owl.vim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme night-owl]])
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
		-- replace all Telescope keymaps with only one mapping
		keys = function()
			return {
				{ "<c-p>", LazyVim.pick("find_files"), desc = "Find Files" },
				{ "<leader>/", LazyVim.pick("find_files"), desc = "Find Files" },
				{ "<leader>gg", LazyVim.pick("find_files"), desc = "Find Files" },
				{ "<leader>ff", LazyVim.pick("live_grep", { root = true }), desc = "Grep (cwd)" },
			}
		end,
		opts = {
			defaults = {
				vimgrep_arguments = {
					"--ignore-case",
				},
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("live_grep_args")
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	branch = "canary",
	-- 	dependencies = {
	-- 		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	-- 		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	-- 	},
	-- 	build = "make tiktoken", -- Only on MacOS or Linux
	-- 	opts = {
	-- 		debug = true, -- Enable debugging
	-- 		-- See Configuration section for rest
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
		commit = "b661269b5b800af1ac72e8f4d8541a6a50cc7d62", -- to work with copilot
		opts = {
			provider = "copilot",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below is optional, make sure to setup it properly if you have lazy=true
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				-- { name = "buffer" },
				-- { name = "path" },
				-- { name = "emoji" },
				-- { name = "treesitter" },
			})

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
						-- cmp.select_next_item()
						cmp.confirm({ select = true })
					elseif vim.snippet.active({ direction = 1 }) then
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				-- ["<C-f>"] = cmp.mapping.confirm({ select = true }),
				-- Remove the default Enter key mapping
				["<CR>"] = function(fallback)
					fallback()
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"cssls",
					"eslint",
					"html",
					"jsonls",
					"tsserver",
					"pyright",
					"tailwindcss",
					"ruby_lsp",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
					"rubocop",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "LazyFile",
		dependencies = {
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
		opts = function()
			---@class PluginLspOpts
			local ret = {
				-- options for vim.diagnostic.config()
				---@type vim.diagnostic.Opts
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = {
						spacing = 4,
						source = "if_many",
						prefix = "●",
						-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
						-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
						-- prefix = "icons",
					},
					severity_sort = true,
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
							[vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
							[vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
							[vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
						},
					},
				},
				-- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
				-- Be aware that you also will need to properly configure your LSP server to
				-- provide the inlay hints.
				inlay_hints = {
					enabled = true,
					exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
				},
				-- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
				-- Be aware that you also will need to properly configure your LSP server to
				-- provide the code lenses.
				codelens = {
					enabled = true,
				},
				-- Enable lsp cursor word highlighting
				document_highlight = {
					enabled = true,
				},
				-- add any global capabilities here
				capabilities = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				},
				-- options for vim.lsp.buf.format
				-- `bufnr` and `filter` is handled by the LazyVim formatter,
				-- but can be also overridden when specified
				format = {
					formatting_options = nil,
					timeout_ms = nil,
				},
				-- LSP Server Settings
				---@type lspconfig.options
				servers = {
					ruby_lsp = {
						mason = false,
						cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
					},
					lua_ls = {},
				},
				-- you can do any additional lsp server setup here
				-- return true if you don't want this server to be setup with lspconfig
				---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
				setup = {
					-- example to setup with typescript.nvim
					-- tsserver = function(_, opts)
					--   require("typescript").setup({ server = opts })
					--   return true
					-- end,
					-- Specify * to use this function as a fallback for any server
					-- ["*"] = function(server, opts) end,
				},
			}
			return ret
		end,
		---@param opts PluginLspOpts
		config = function(_, opts)
			-- setup autoformat
			LazyVim.format.register(LazyVim.lsp.formatter())

			-- setup keymaps
			LazyVim.lsp.on_attach(function(client, buffer)
				require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			LazyVim.lsp.setup()
			LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

			LazyVim.lsp.words.setup(opts.document_highlight)

			-- diagnostics signs
			if vim.fn.has("nvim-0.10.0") == 0 then
				if type(opts.diagnostics.signs) ~= "boolean" then
					for severity, icon in pairs(opts.diagnostics.signs.text) do
						local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
						name = "DiagnosticSign" .. name
						vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
					end
				end
			end

			if vim.fn.has("nvim-0.10") == 1 then
				-- inlay hints
				if opts.inlay_hints.enabled then
					LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
						if
							vim.api.nvim_buf_is_valid(buffer)
							and vim.bo[buffer].buftype == ""
							and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
						then
							vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
						end
					end)
				end

				-- code lens
				if opts.codelens.enabled and vim.lsp.codelens then
					LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
						vim.lsp.codelens.refresh()
						vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
							buffer = buffer,
							callback = vim.lsp.codelens.refresh,
						})
					end)
				end
			end

			if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
				opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
					or function(diagnostic)
						local icons = LazyVim.config.icons.diagnostics
						for d, icon in pairs(icons) do
							if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
								return icon
							end
						end
					end
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			local servers = opts.servers
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_cmp and cmp_nvim_lsp.default_capabilities() or {},
				opts.capabilities or {}
			)

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})
				if server_opts.enabled == false then
					return
				end

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			-- get all the servers that are available through mason-lspconfig
			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mslp_servers = {}
			if have_mason then
				all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					if server_opts.enabled ~= false then
						-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
						if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
							setup(server)
						else
							ensure_installed[#ensure_installed + 1] = server
						end
					end
				end
			end

			if have_mason then
				mlsp.setup({
					ensure_installed = vim.tbl_deep_extend(
						"force",
						ensure_installed,
						LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
					),
					handlers = { setup },
				})
			end

			if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
				local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
				LazyVim.lsp.disable("vtsls", is_deno)
				LazyVim.lsp.disable("denols", function(root_dir, config)
					if not is_deno(root_dir) then
						config.settings.deno.enable = false
					end
					return false
				end)
			end
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"<leader>v",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
				end,
				desc = "Explorer NeoTree (Root Dir)",
			},
		},
		opts = {
			sources = { "filesystem", "buffers", "git_status" },
			filesystem = {
				filtered_items = {
					always_show = {
						".github",
						".config",
						".gitignore",
					},
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				git_status = {
					symbols = {
						unstaged = "U",
						staged = "S",
					},
				},
			},
		},
	},
}
