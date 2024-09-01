local cmp = require'cmp'
require("mason").setup()
require("mason-lspconfig").setup()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete({select = true}),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = function (fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'path' },
		{
			name = "lazydev",
			group_index = 0,
		},
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup{
			capabilities = capabilities
		}
	end,
	["lua_ls"] = function()
		lspconfig['lua_ls'].setup {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT"
					}
				}
			}
		}
	end,
	["zls"] = function ()
		lspconfig["zls"].setup{
			-- cmd = {"~/.local/share/nvim/mason/bin/zls"},

			settings = {
				zls = {
					zig_exe_path = "/home/hello/apps/zig-linux/zig",
					zig_lib_path = "/home/hello/apps/zig-linux/lib/"
				}
			},
		}
	end,
}

