local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.filetype.add({
    extension = { plk = "plank" },
  })

  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok or not parsers then
    vim.notify("[plank.nvim] nvim-treesitter not available", vim.log.levels.WARN)
    return
  end

  local parser_configs = parsers.get_parser_configs()
  parser_configs.plank = {
    install_info = {
      url = "https://github.com/plankevm/plank-monorepo",
      location = "plank-tree-sitter",
      branch = "main",
      files = { "src/parser.c", "src/scanner.c" },
    },
    filetype = "plank",
  }
end

return M
