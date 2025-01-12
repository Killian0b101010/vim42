
#!/bin/bash

# ✅ Couleurs pour les messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Installation de c_formatter_42 et vim-42header...${NC}"

# ✅ Vérifier et installer Python3
if ! command -v python3 &> /dev/null; then
    echo -e "${GREEN}📦 Installation de Python3...${NC}"
    sudo apt-get install python3 python3-pip -y 2>/dev/null || brew install python3 || sudo pacman -S python
fi

# ✅ Vérifier et installer Git
if ! command -v git &> /dev/null; then
    echo -e "${GREEN}📦 Installation de Git...${NC}"
    sudo apt-get install git -y 2>/dev/null || brew install git || sudo pacman -S git
fi

# ✅ Cloner le dépôt c_formatter_42
if [ ! -d "$HOME/.local/share/c_formatter_42" ]; then
    echo -e "${GREEN}🔄 Clonage du dépôt c_formatter_42...${NC}"
    git clone https://github.com/dawnbeen/c_formatter_42.git ~/.local/share/c_formatter_42
else
    echo -e "${GREEN}✅ Le dépôt c_formatter_42 est déjà présent.${NC}"
fi

# ✅ Installer les dépendances Python pour le formatter
echo -e "${GREEN}📦 Installation des dépendances Python...${NC}"
pip3 install -r ~/.local/share/c_formatter_42/requirements-dev.txt

# ✅ Créer le script exécutable f42
echo -e "${GREEN}⚙️  Création de la commande f42...${NC}"

sudo bash -c 'cat <<EOF > /usr/local/bin/f42
#!/bin/bash
PYTHONPATH="\$HOME/.local/share/c_formatter_42" python3 -m c_formatter_42 "\$@"
EOF'

sudo chmod +x /usr/local/bin/f42

# ✅ Installer le plugin vim-42header de pbondoer
if [ ! -d "$HOME/.vim/pack/plugins/start/vim-42header" ]; then
    echo -e "${GREEN}🔄 Installation du plugin vim-42header...${NC}"
    git clone https://github.com/pbondoer/vim-42header.git ~/.vim/pack/plugins/start/vim-42header
else
    echo -e "${GREEN}✅ Le plugin vim-42header est déjà installé.${NC}"
fi

# ✅ Configuration automatique du Header 42 dans .vimrc
echo -e "${GREEN}⚙️  Configuration automatique du Header 42...${NC}"
cat <<EOF >> ~/.vimrc

" === Configuration du vim-42header ===
let g:user42 = "Killian0b101010"
let g:mail42 = "ton.email@42.fr"
EOF

echo -e "${GREEN}🎉 Installation terminée !${NC}"
echo -e "${GREEN}📝 Utilise :Stdheader dans Vim pour insérer le header 42.${NC}"
echo -e "${GREEN}📝 Utilise la commande : f42 <fichier.c> pour formater ton code.${NC}"
