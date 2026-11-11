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

## Git

[`.gitconfig`](./.gitconfig#L11) includes a second file that is not in the repo (`~/.gitconfig-local`).

This keeps personal or machine-specific settings out of version control.

If you want to use local settings, create `~/.gitconfig-local` yourself.

For example:

```ini
[user]
    name = Your Name
    email = you@example.com
```

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
