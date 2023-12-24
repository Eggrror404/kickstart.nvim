local function autoformat_toggled()
  local b = vim.b.autoformat
  local g = vim.g.autoformat

  if b ~= nil then
    return b
  end

  return g == nil or g
end

local function setup(bufnr)
  vim.keymap.set(
    "n",
    "<leader>uf",
    "<cmd>AutoFormatToggle<cr>",
    { desc = "Toggle autoformat for buffer", buffer = bufnr }
  )

  vim.api.nvim_buf_create_user_command(bufnr, "AutoFormatToggle", function()
    vim.b.autoformat = not autoformat_toggled()
    vim.notify(
      "Autoformat toggled " .. (autoformat_toggled() and "on" or "off") .. " for current buffer"
    )
  end, { desc = "Toggle autoformat for buffer" })

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      if not autoformat_toggled() then
        return
      end

      vim.cmd("Format")
    end,
  })
end

return { setup = setup, autoformat_toggled = autoformat_toggled }
