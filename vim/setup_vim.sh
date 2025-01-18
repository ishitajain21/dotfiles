#!/bin/bash

# Install vim-plug if not exists
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Installing vim-plug..."
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Create symbolic links for vim configurations
for config in .vimrc .vim .config/nvim; do
    if [ -e "$PWD/$config" ]; then
        echo "Linking $config..."
        ln -sf "$PWD/$config" "$HOME/$config"
    fi
done

# Install plugins if using vim-plug
if command -v vim >/dev/null 2>&1; then
    echo "Installing Vim plugins..."
    vim +PlugInstall +qall
fi

# Install plugins if using Neovim
if command -v nvim >/dev/null 2>&1; then
    echo "Installing Neovim plugins..."
    nvim +PlugInstall +qall
fi
