#!/bin/bash

# ✅ Vérifier et installer Python3
if ! command -v python3 &> /dev/null; then
    echo "Installation de Python3..."
    sudo apt-get install python3 python3-pip -y 2>/dev/null || brew install python3 || sudo pacman -S python
fi

# ✅ Vérifier et installer Git
if ! command -v git &> /dev/null; then
    echo "Installation de Git..."
    sudo apt-get install git -y 2>/dev/null || brew install git || sudo pacman -S git
fi

# ✅ Installer c_formatter_42
if [ ! -d "$HOME/.local/share/c_formatter_42" ]; then
    echo "Clonage du dépôt c_formatter_42..."
    git clone https://github.com/dawnbeen/c_formatter_42.git ~/.local/share/c_formatter_42
fi

# ✅ Installer les dépendances Python pour le formatter
pip3 install -r ~/.local/share/c_formatter_42/requirements-dev.txt

# ✅ Créer la commande f42
sudo bash -c 'cat <<EOF > /usr/local/bin/f42
#!/bin/bash
PYTHONPATH="\$HOME/.local/share/c_formatter_42" python3 -m c_formatter_42 "\$@"
EOF'

sudo chmod +x /usr/local/bin/f42

# ✅ Installer le plugin vim-42header
if [ ! -d "$HOME/.vim/pack/plugins/start/vim-42header" ]; then
    git clone https://github.com/pbondoer/vim-42header.git ~/.vim/pack/plugins/start/vim-42header
fi

# ✅ Configuration automatique de Vim (commande simplifiée)
if ! grep -q "Configuration automatique pour 42" ~/.vimrc; then
    cat <<EOF >> ~/.vimrc

" === Configuration automatique pour 42 ===
set number
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set novisualbell
set t_vb=

" === Raccourcis ===
" Compilation simple sans message, montre les erreurs ou lance le programme
nnoremap /c :w \| :!gcc -Wall -Wextra -Werror % -o %< && ./%<<CR>

" Sauvegarde rapide
nnoremap /s :w!<CR>

" Quitter rapidement
nnoremap /q :q!<CR>

" Insérer le header 42
nnoremap /h :Stdheader<CR>

" Formatter avec c_formatter_42
command! F42 :silent !python3 \$HOME/.local/share/c_formatter_42/c_formatter_42.py %
EOF
else
    echo "La configuration Vim est déjà présente."
fi

echo "✅ Installation terminée."
