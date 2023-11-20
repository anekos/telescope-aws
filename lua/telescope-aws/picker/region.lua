local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local state = require('telescope.actions.state')

local cache = nil

return function(opts)
  opts = opts or {}

  if cache == nil then
    cache = {}
    for _, entry in ipairs(vim.fn.json_decode(vim.fn.system('aws account list-regions'))['Regions']) do
      if entry['RegionOptStatus'] == 'ENABLED_BY_DEFAULT' then
        table.insert(cache, entry['RegionName'])
      end
    end
  end

  pickers
    .new(opts, {
      prompt_title = 'AWS Default Region',
      finder = finders.new_table {
        results = cache,
      },
      sorter = sorters.fuzzy_with_index_bias(),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local region_name = state.get_selected_entry().value
          vim.env['AWS_DEFAULT_REGION'] = region_name
        end)
        return true
      end,
    })
    :find()
end
