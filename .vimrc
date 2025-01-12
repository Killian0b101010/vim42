set number            " Affiche les numéros de ligne
syntax on             " Active la coloration syntaxique
set tabstop=4         " Définit la largeur des tabulations
set shiftwidth=4      " Définit la largeur de l'indentation
set expandtab         " Convertit les tabulations en espaces
set number       " Affiche les numéros de ligne
set relativenumber   " Numéros relatifs pour naviguer plus facilement
set noerrorbells      " Désactive les bips sonores
set novisualbell      " Désactive les flashs visuels
set t_vb=             " Supprime complètement le flash

nnoremap /c :!gcc -Wall -Wextra -Werror % -o %< && ./%<<CR>

" Raccourci /s pour sauvegarder
nnoremap /s :w!<CR>

" Raccourci /q pour quitter
nnoremap /q :q!<CR>

" Raccouri pour header 42
nnoremap /h :Stdheader<CR>

" Commande pour formater le fichier courant avec c_formatter_42
command! F42 :silent !python3 $HOME/.local/share/c_formatter_42/c_formatter_42.py %


