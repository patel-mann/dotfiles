## Setup
- Minimal Neovim config meant to be a starting point for new neovim users(like me).
- Please check out the original work from [Tinyvim by NvChad](https://github.com/NvChad/tinyvim).

### Neovim Setup
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
> I've update my dev env from the last time to use the NvChad, which is similar to tinyvim

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
### I3 Setup
```bash
dnf install nextcloud-client scrot picom feh
dnf install git go nvim

```
