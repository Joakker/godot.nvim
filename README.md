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

- [ ] Syntax highlighting
    - [ ] GDScript
    - [ ] Resource files
    - [ ] Text scenes
- [x] Exporting templates
- [ ] Evaluating scripts
