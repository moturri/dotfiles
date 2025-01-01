This repository contains my personal dotfiles and configurations for a streamlined Arch Linux setup using **Qtile** as the window manager. These dotfiles are tailored for a fast and efficient workflow and include configurations for various tools and applications such as **Zsh**, **Neovim**, **Tmux**, **Wezterm**, **Ranger**, and more.

## Overview

These dotfiles are designed for use on **Arch Linux** with **Qtile** as the window manager, using the **LTS Kernel**. Key features include enhanced terminal experience, window management optimizations, efficient use of custom scripts, and a beautiful desktop environment.

The setup uses **Qtile-extras** for the Qtile bar decorations, **Zimfw** for the Zsh shell, **Wezterm** (and optionally **Alacritty**) for terminals, and much more to create a cohesive and productive environment.

## Key Features

- **Qtile** configuration, optimized with **qtile-extras** for a visually appealing bar.
- **Zsh** with **zimfw**, enhanced with custom scripts and plugins (`fzf`, `zoxide`, `tldr`).
- **Neovim** setup using **Lazy Vim** for plugin management.
- **Wezterm** as the default terminal, **Kitty** used for scratchpads in Qtile.
- **Tmux** with **TPM** (Tmux Plugin Manager) for effective session management.
- **Ranger** and **Yazi** as terminal-based file managers.
- **Sayonara** music player configured with a custom CSS for dark mode.
- **Fonts**: inter-font for the display, ttf-jetbrains-mono-nerd for the terminal, and additional Nerd Fonts for **Wezterm** fallback.
- **Arch-specific** tweaks and optimizations, tested on **Arch with Qtile** using the **LTS Kernel**.

## Installation

### Step 1: Clone the Repository

First, clone this repository to your home directory:

```bash
git clone https://github.com/moturri/dotfiles.git ~/.dotfiles

### Step 2: Run the Install Script

After cloning, run the install.sh script to create symlinks for all configuration files:

cd ~/.dotfiles
./install.sh

Use GNU stow to create symlinks to the appropriate dotfiles (e.g., ~/.zshrc, ~/.vimrc, etc.) and set up various utilities.

### Step 3: Install Dependencies

Ensure you have all the necessary packages installed. The setup relies on the following tools:

Install these packages using your package manager (e.g., yay, pacman):

yay -S qtile-extras wezterm tmux ranger yazi vim fzf brightnessctl acpi zoxide pavucontrol picom network-manager-applet tldr neovim sayonara xorg-xrandr xorg-xinput

### Step 4: Install Zsh Plugins

This setup uses Zimfw to manage Zsh plugins. After installation, run:

zsh
zimfw install

Step 5: Configure Fonts

Install the required fonts, including Nerd Fonts for full support in Wezterm. You can download these from Nerd Fonts.

To install JetBrains Mono Nerd and Inter-font:

yay -S ttf-jetbrains-mono-nerd inter-font


Configuration Details

Qtile

- **qtile-extras** is used for enhanced bar decorations. The package can be installed from the AUR using `yay -S qtile-extras`.
- Custom widgets for **brightness** (using `brightnessctl`), **battery** (using `acpi`), and **volume** (using `pactl`) are included in the Qtile config.
- Emoji support is required for certain widgets to display properly. 
- Touchpad sensitivity is configured via the `monitors.sh` script, which uses `xorg-xinput` for fine-tuning.


Desktop 

- **Flat Remix Darkest** theme for a modern and dark aesthetic.
- **Kora Icon Themes** for Qtile and other UI elements.
- **Material-dark theme** for **Kvantum** and **qt5ct/qt6ct** support on Qtile.

Custom Display and Touchpad

- **.xprofile** configures the custom display using `xrandr` for screen management.
- Touchpad settings are handled with `monitors.sh`, which configures sensitivity and tap-to-click settings using `xinput`.

Usage

Once the installation is complete:

1. Reload your Zsh configuration:

    source ~/.zshrc

2. Reload your Tmux session (if applicable):

    tmux source-file ~/.tmux.conf

3. Reload Qtile to apply the changes:

    qtile cmd-obj --object cmd --function restart

Updates

This repository will be updated regularly as Arch Qtile is my daily driver, so expect constant improvements and new features as I fine-tune my setup.


```
