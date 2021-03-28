# godot.nvim

> This plugin is in early development, so please have that in mind

`godot.nvim` aims to integrate neovim to your godot workflow, by providing
syntax highlighting, an interface for exporting your templates, and more.

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'Joakker/godot.nvim',
    requires = 'nvim-lua/plenary.nvim'
}
```

Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nvim-lua/plenary.nvim'
Plug 'Joakker/godot.nvim'
```

## TODO list

Completion depends on whether there is basic functionality implemented, not
necessarily complete integration. I have to know what to optimize first.

- [ ] Syntax highlighting
    - [ ] GDScript
    - [ ] Resource files
    - [ ] Text scenes
- [X] Exporting templates
- [X] Evaluating scripts
- [ ] Use treesitter for GDScript highlighting

## Contributing

Pull requests are more than welcome. Feel free to open issues if you feel
something is missing or if something doesn't work for you :smiley: .
