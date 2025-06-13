local M = {}

local file_extension_rules = {
  lua = {
    src_dir = "lua/",
    test_dir = "tests/",
    impl_ext = "%.lua$",
    impl_ext_plain = ".lua",
    test_ext = "_test.lua",
  },
  elixir = {
    src_dir = "lib/",
    test_dir = "test/",
    impl_ext = "%.ex$",
    impl_ext_plain = ".ex",
    test_ext = "_test.exs",
  },
  -- Add more filetypes as needed
}

function M.switch_buffer_to_test()
  local filetype = vim.bo.filetype
  local current_file = vim.api.nvim_buf_get_name(0)
  local new_file
  local file_extension_rule = file_extension_rules[filetype]

  if not file_extension_rule then
    print("No toggle rule defined for filetype: " .. filetype)
    return
  end

  if current_file:find("test") or current_file:find("_test.exs") then
    -- Assume we're in a test file; switch to implementation
    -- stylua: ignore
    new_file = current_file
	:gsub(file_extension_rule.test_dir, file_extension_rule.src_dir)
	:gsub(file_extension_rule.test_ext, file_extension_rule.impl_ext_plain)
  else
    -- Assume we're in an implementation file; switch to test
    -- stylua: ignore
    new_file = current_file
	:gsub(file_extension_rule.src_dir, file_extension_rule.test_dir)
	:gsub(file_extension_rule.impl_ext, file_extension_rule.test_ext)
  end

  if vim.fn.filereadable(new_file) == 1 then
    vim.cmd("edit " .. new_file)
  else
    print("Target file doesn't exist: " .. new_file)
  end
end

return M
