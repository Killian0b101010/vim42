# ✅ Configuration automatique du Header 42 et des raccourcis dans .vimrc
echo -e "${GREEN}⚙️  Configuration automatique de Vim...${NC}"

if ! grep -q "Configuration automatique pour 42" ~/.vimrc; then
    cat <<EOF >> ~/.vimrc

" === Configuration automatique pour 42 ===
set number            " Affiche les numéros de ligne
syntax on             " Active la coloration syntaxique
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
    echo -e "${GREEN}✅ Configuration Vim déjà présente.${NC}"
fi
