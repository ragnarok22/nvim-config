local extract_word = function()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local col = cursor_pos[2] + 1

  for _, quote in ipairs { '"', "'" } do
    for start_idx, word, end_idx in line:gmatch('()' .. quote .. '(.-)' .. quote .. '()') do
      if col >= start_idx and col < end_idx then
        return word
      end
    end
  end
end

_G.open_github_url = function()
  local word = extract_word()
  if not word then
    vim.notify('No valid word found in quotes', vim.log.levels.WARN)
    return
  end

  local _, err = vim.ui.open('https://github.com/' .. word)
  if err then
    vim.notify('Failed to open URL: ' .. err, vim.log.levels.ERROR)
  end
end

local function is_valid_package_repo(str)
  local has_repo_format = str:match '^[^%s/]+/[^%s/]+$' ~= nil

  local config_path = vim.fn.stdpath 'config'
  local current_path = vim.fn.expand '%:p:h'
  local is_nvim_config_path = current_path:find(config_path, 1, true)

  return has_repo_format and is_nvim_config_path
end

-- Remove the default handler before replacing the menu entries it expects.
vim.api.nvim_clear_autocmds { group = 'nvim.popupmenu' }

local group = vim.api.nvim_create_augroup('nvim_popupmenu', { clear = true })
vim.api.nvim_create_autocmd('MenuPopup', {
  pattern = '*',
  group = group,
  desc = 'Custom PopUp Setup',
  callback = function()
    vim.cmd [[
      amenu disable PopUp.Definition
      amenu disable PopUp.References
      amenu disable PopUp.Goto
    ]]

    if vim.lsp.get_clients({ bufnr = 0 })[1] then
      vim.cmd [[
        amenu enable PopUp.Definition
        amenu enable PopUp.References
      ]]
    end

    local word = extract_word()

    if word and is_valid_package_repo(word) then
      vim.cmd [[
        amenu enable PopUp.Goto
      ]]
    end
  end,
})

vim.cmd [[
  aunmenu PopUp
  anoremenu PopUp.Inspect     <cmd>Inspect<CR>
  amenu PopUp.-1-             <NOP>
  anoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
  anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
  nnoremenu PopUp.Back        <C-t>
  amenu PopUp.-2-             <NOP>
  amenu     PopUp.URL         gx
  anoremenu PopUp.Goto        <cmd>lua _G.open_github_url()<CR>
]]
