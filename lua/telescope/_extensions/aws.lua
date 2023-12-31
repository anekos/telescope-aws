local telescope = require('telescope')

local profile_picker = require('telescope-aws.picker.profile')
local region_picker = require('telescope-aws.picker.region')

return telescope.register_extension({
  -- setup = function(ext_conf, conf) end,
  exports = {
    aws = profile_picker,
    profile = profile_picker,
    region = region_picker,
  },
})
