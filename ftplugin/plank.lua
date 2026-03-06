if vim.b.did_ftplugin_plank then return end
vim.b.did_ftplugin_plank = true

-- Buffer-local only!
local opt                = vim.bo

opt.expandtab            = true
opt.shiftwidth           = 4
opt.softtabstop          = 4
opt.commentstring        = "// %s"
