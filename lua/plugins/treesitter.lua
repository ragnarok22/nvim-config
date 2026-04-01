return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  init = function()
    -- Neovim 0.12 changed match[capture_id] from TSNode to TSNode[] in
    -- predicate/directive handlers. nvim-treesitter master hasn't been updated.
    -- Wrap registrations to auto-unwrap node lists for backward compat.
    if vim.fn.has 'nvim-0.12' ~= 1 then
      return
    end
    local query = vim.treesitter.query
    local orig_add_predicate = query.add_predicate
    local orig_add_directive = query.add_directive

    local function compat_match(match)
      return setmetatable({}, {
        __index = function(_, k)
          local v = match[k]
          if type(v) == 'table' and type(k) == 'number' then
            return v[1]
          end
          return v
        end,
      })
    end

    query.add_predicate = function(name, handler, opts)
      return orig_add_predicate(name, function(match, ...)
        return handler(compat_match(match), ...)
      end, opts)
    end
    query.add_directive = function(name, handler, opts)
      return orig_add_directive(name, function(match, ...)
        return handler(compat_match(match), ...)
      end, opts)
    end
    query._ts_compat_restore = function()
      query.add_predicate = orig_add_predicate
      query.add_directive = orig_add_directive
      query._ts_compat_restore = nil
    end
  end,
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    -- Restore original functions so other plugins aren't affected
    if vim.treesitter.query._ts_compat_restore then
      vim.treesitter.query._ts_compat_restore()
    end
  end,
  opts = {
    ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
