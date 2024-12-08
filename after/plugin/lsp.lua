local lsp_zero = require('lsp-zero')
local luasnip = require('luasnip')

-- for more information on tab behavior...
 -- see https://lsp-zero.netlify.app/v3.x/autocomplete.html#enable-super-tab
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()




require("luasnip.loaders.from_vscode").lazy_load()

-- luasnip.config.set_config{
--     history = true,
--     updateEvents = "TextChanged, TextChangedI",
--     enable_autosnippets = true
-- }


cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },


    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },


    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        -- Super tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item({behavior = 'select'})
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        -- Super shift tab
        ['<S-Tab>'] = cmp.mapping(function(fallback)

            if cmp.visible() then
                cmp.select_prev_item({behavior = 'select'})
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    }),
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
