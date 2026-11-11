# sway-dotfiles
My sway config.

## Install

```sh
git clone https://github.com/GuidOrZ/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Preview what will happen without making changes:

```sh
./install.sh --dry-run
```

Install:

```sh
./install.sh --install
```

### What the script does

- Creates missing parent directories.
- Never overwrites anything, skipped targets are reported (if a file already exists at target, just move or delete it).

## Requirements:
- sway
- zsh
- tmux
- kitty
- fastfetch
- i3status-rust
- fsel

---

`Program-specific information is provided in their respective config directories.`
