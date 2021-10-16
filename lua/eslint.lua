-- this is mainly for testing, if this works, probably put this in github and install it from Plug
-- simple way to use this is just put it under ~/.local/share/nvim/site/lua/
-- I'm mapping this to <leader>kl  (kei lint)
print 'loading my eslint.lua plugin'

local Job = require('plenary.job')

local M = {}

M.execEsLint = function()
  if vim.opt.filetype:get() == 'javascript' then
    vim.api.nvim_command('write')

    Job:new({
      command = 'eslint',
      args = { vim.fn.expand('%:p'), '--fix' },
      on_exit = function(j, return_val)
        if return_val == 1 then
          for _, item in ipairs(j:result()) do
            print(item)
          end
        end

      end,
    }):sync()

    vim.api.nvim_command('edit')
  end
end

return M
