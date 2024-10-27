local lsp_zero = require('lsp-zero')
 -- for more information on tab behavior...
 -- see https://lsp-zero.netlify.app/v3.x/autocomplete.html#enable-super-tab
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

--  local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n","<leader>e", function() vim.lsp.buf.definition() end, opts)
end)


-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'dockerls','docker_compose_language_service','lua_ls','ts_ls','jsonls','volar'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls = function()
	    --- in this function you can setup
	    --- the language server however you want. 
	    --- in this example we just use lspconfig

	    require('lspconfig').lua_ls.setup({
		    settings ={
			    Lua = {
				    diagnostics = {
					    globals={"vim","require"}
				    }
			    }}
		    })
	    end,
  },
})
