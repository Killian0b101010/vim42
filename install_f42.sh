#!/bin/bash

# ✅ Couleurs pour les messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Installation de c_formatter_42...${NC}"

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

# ✅ Installer les dépendances Python
echo -e "${GREEN}📦 Installation des dépendances Python...${NC}"
pip3 install -r ~/.local/share/c_formatter_42/requirements-dev.txt

# ✅ Créer le script exécutable f42
echo -e "${GREEN}⚙️  Création de la commande f42...${NC}"

sudo bash -c 'cat <<EOF > /usr/local/bin/f42
#!/bin/bash
PYTHONPATH="\$HOME/.local/share/c_formatter_42" python3 -m c_formatter_42 "\$@"
EOF'

# ✅ Donner les droits d'exécution
sudo chmod +x /usr/local/bin/f42

echo -e "${GREEN}🎉 Installation terminée ! Utilise la commande : f42 <fichier.c>${NC}"

