# A Collection of Inspired Dotfiles 
Here is a relatively configured set of dotfiles inspired from [ThePrimagen](https://github.com/ThePrimeagen/init.lua/tree/master), [Suttle MacOS Defaults](https://github.com/kevinSuttle/macOS-Defaults)
and with personal additions these include most importantly the package manager of choice the fast [Lazy](https://github.com/folke/lazy.nvim)
tmux, [wezterm (fabulous terminal emulator written in Rust)](https://wezfurlong.org/wezterm/)
many of [tpope's wonderful vim plugins](https://github.com/tpope) such as commentary, vinegar, and surround
,the [lualine](https://github.com/nvim-lualine/lualine.nvim), [noice (although you might want to configure this more)](https://github.com/folke/noice.nvim), [vimtex](https://github.com/lervag/vimtex),
and [silicon for sharing code snippets (please check its own dependencies)](https://github.com/krivahtoo/silicon.nvim). 

## Prerequisites
-- zsh and .zshenv at ~
-- nvim
-- tmux (optional)
-- wezterm (optional)
-- brew (optional)

### Contents of .zshenv 
```
export ZDOTDIR="$HOME/.config"
```
### Apply MacOS Defaults
```
zsh ./.macos
```

## Notes
You can bootstrap this repository however you like.

ThePrimagen's package manager is Packer, migrated to Lazy as the better option. Some MacOS defaults
such as ask for password immediately after screensaver is reportedly not working. The included defaults
are my selection and very few inclusions adapted for the new MacOS Sonoma.

