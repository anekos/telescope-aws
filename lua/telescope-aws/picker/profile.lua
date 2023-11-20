local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local state = require('telescope.actions.state')

return function(opts)
  opts = opts or {}

  local results = vim.fn.systemlist('aws configure list-profiles')

  pickers
    .new(opts, {
      prompt_title = 'AWS Profile',
      finder = finders.new_table {
        results = results,
      },
      sorter = sorters.fuzzy_with_index_bias(),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local profile_name = state.get_selected_entry().value
          vim.env['AWS_PROFILE'] = profile_name
        end)
        return true
      end,
    })
    :find()
end
