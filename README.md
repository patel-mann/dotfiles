## My Dev Setup
- Minimal Neovim config meant to be a starting point for new neovim users.
- Please check out the original work from [Tinyvim by NvChad](https://github.com/NvChad/tinyvim).

### Neovim Setup
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim && nvim
```
> I've update my dev env form the last time to use the starter lazyvim from tinyvim 

### Ghostty Setup
1. Backup your current config (optional)
``` bash
mv ~/.config/ghostty/config.ghostty  ~/.config/ghostty/config.ghostty.bak
```
2. Copy the content of `ghostty` in your local ghostty config dir (typically at `~/.config/ghostty` in linux)
```bash
cd ~/.config/ghostty
curl -O https://raw.githubusercontent.com/patel-mann/dotfiles/refs/heads/main/ghostty/config.ghostty
```
