#!/bin/bash

# ✅ Vérifier et installer Python3
if ! command -v python3 &> /dev/null; then
    echo "📦 Installation de Python3..."
    sudo apt-get install python3 python3-pip -y 2>/dev/null || brew install python3 || sudo pacman -S python
fi

# ✅ Vérifier et installer Git
if ! command -v git &> /dev/null; then
    echo "📦 Installation de Git..."
    sudo apt-get install git -y 2>/dev/null || brew install git || sudo pacman -S git
fi

# ✅ Installer c_formatter_42
if [ ! -d "$HOME/.local/share/c_formatter_42" ]; then
    echo "🔄 Clonage du dépôt c_formatter_42..."
    git clone https://github.com/dawnbeen/c_formatter_42.git ~/.local/share/c_formatter_42
else
    echo "✅ Le dépôt c_formatter_42 est déjà présent."
fi

# ✅ Installer les dépendances Python pour le formatter
echo "📦 Installation des dépendances Python..."
pip3 install -r ~/.local/share/c_formatter_42/requirements-dev.txt

# ✅ Créer la commande f42
echo "⚙️  Création de la commande f42..."

sudo bash -c 'cat <<EOF > /usr/local/bin/f42
#!/bin/bash
PYTHONPATH="\$HOME/.local/share/c_formatter_42" python3 -m c_formatter_42 "\$@"
EOF'

sudo chmod +x /usr/local/bin/f42

# ✅ Installer le plugin vim-42header
if [ ! -d "$HOME/.vim/pack/plugins/start/vim-42header" ]; then
    echo "🔄 Installation du plugin vim-42header..."
    git clone https://github.com/pbondoer/vim-42header.git ~/.vim/pack/plugins/start/vim-42header
else
    echo "✅ Le plugin vim-42header est déjà installé."
fi

# ✅ Configuration automatique de Vim avec couleurs par défaut
echo "⚙️  Configuration automatique de Vim..."

if ! grep -q "Configuration automatique pour 42" ~/.vimrc; then
    cat <<EOF >> ~/.vimrc

" === Configuration automatique pour 42 ===
set number            " Affiche les numéros de ligne
syntax enable         " Active la coloration syntaxique par défaut
set tabstop=4         " Définit la largeur des tabulations
set shiftwidth=4      " Définit la largeur de l'indentation
set expandtab         " Convertit les tabulations en espaces
set noerrorbells      " Désactive les bips sonores
set visualbell        " Active le bip visuel

" === Raccourcis personnalisés ===
nnoremap /c :!gcc -Wall -Wextra -Werror % -o %< && ./%<<CR>   " Compile et exécute le fichier courant
nnoremap /s :w!<CR>                                           " Sauvegarde rapide avec /s
nnoremap /q :q!<CR>                                           " Quitter rapidement avec /q
nnoremap /h :Stdheader<CR>                                    " Insérer le header 42 avec /h

" === Commande pour formater avec c_formatter_42 ===
command! F42 :silent !python3 \$HOME/.local/share/c_formatter_42/c_formatter_42.py %
EOF
else
    echo "✅ Configuration Vim déjà présente."
fi

echo "🎉 Installation terminée !"
echo "📝 Utilise :Stdheader dans Vim pour insérer le header 42."
echo "📝 Utilise la commande : f42 <fichier.c> pour formater ton code."
