local extract_word = function()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local col = cursor_pos[2] + 1

  local matches = {}

  -- Search for all matches between double quotes
  for match in line:gmatch '"(.-)"' do
    local start_idx, end_idx = line:find('"' .. match .. '"', 1, true)
    if start_idx and end_idx then
      table.insert(matches, { word = match, start_idx = start_idx, end_idx = end_idx })
    end
  end

  -- Search for all matches between single quotes
  for match in line:gmatch "'(.-)'" do
    local start_idx, end_idx = line:find("'" .. match .. "'", 1, true)
    if start_idx and end_idx then
      table.insert(matches, { word = match, start_idx = start_idx, end_idx = end_idx })
    end
  end

  -- Select the word that contains the cursor
  local word = nil
  for _, match in ipairs(matches) do
    if col >= match.start_idx and col <= match.end_idx then
      word = match.word
      break
    end
  end

  if not word then
    vim.notify 'No valid word found in quotes'
    return
  end

  return word
end

_G.open_github_url = function()
  local word = extract_word()
  local url = 'https://github.com/' .. word
  local open_cmd

  if vim.fn.has 'mac' == 1 then
    open_cmd = { 'open', url }
  elseif vim.fn.has 'unix' == 1 then
    open_cmd = { 'xdg-open', url }
  elseif vim.fn.has 'win32' == 1 then
    open_cmd = { 'cmd.exe', '/C', 'start', '', url }
  else
    vim.notify 'Unsupported OS for opening URLs'
    return
  end

  vim.notify('Executing command:', table.concat(open_cmd, ' '))

  local job_id = vim.fn.jobstart(open_cmd, { detach = true })

  if job_id > 0 then
    -- Opened successfully
  else
    vim.notify 'Failed to open URL'
  end
end

local function is_valid_package_repo(str)
  return str:match '^[^%s/]+/[^%s/]+$' ~= nil
end

local group = vim.api.nvim_create_augroup('nvim_popupmenu', { clear = true })
vim.api.nvim_create_autocmd('MenuPopup', {
  pattern = '*',
  group = group,
  desc = 'Custom PopUp Setup',
  callback = function()
    vim.cmd [[
      amenu disable PopUp.Definition
      amenu disable PopUp.References
      amenu disable PopUp.URL
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
  amenu     PopUp.Goto        :lua _G.open_github_url()<CR>
]]
