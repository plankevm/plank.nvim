local M = {}

function M.check()
  vim.health.start("plank.nvim")

  -- 1. nvim-treesitter dependency
  local ts_ok = pcall(require, "nvim-treesitter.parsers")
  if ts_ok then
    vim.health.ok("nvim-treesitter is installed")
  else
    vim.health.error("nvim-treesitter not found", {
      "Install nvim-treesitter (required for parser installation and highlighting)",
    })
    return -- no point checking the rest
  end

  -- 2. Parser .so compiled and loadable
  local parser_installed = #vim.api.nvim_get_runtime_file("parser/plank.so", false) > 0
  if parser_installed then
    vim.health.ok("plank parser is installed")
  else
    vim.health.warn("plank parser not installed", {
      "Run `:TSInstall plank`"
    })
  end

  -- 3. Highlight queries discoverable
  local highlights = vim.api.nvim_get_runtime_file("queries/plank/highlights.scm", false)
  if #highlights > 0 then
    vim.health.ok("highlights.scm found: " .. highlights[1])
  else
    vim.health.error("queries/plank/highlights.scm not found on runtimepath", {
      "Highlighting will not work",
      "This is most likely a bug, we'd be greatful if you'd open a small issue.",
    })
  end
end

return M
