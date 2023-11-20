# telescope-aws

`telescope-aws` is an extension for [telescope.nvim][], which provide a `profile` picker.

[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim

# Setup

To load the extension, use the following command:

```lua
require('telescope').load_extension('aws')
```

# Usage

## To set `AWS_PROFILE`

```vim
:Telescope aws profile
```

 or 

```vim
:Telescope aws
```

## To set `AWS_DEFAULT_REGION`

```vim
:Telescope aws region
```
