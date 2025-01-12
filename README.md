# 📦 Installation Automatisée du Formatter 42 et Header 42

Ce projet installe automatiquement :
- Le **formatter 42** (commande `f42`)
- Le **plugin Header 42** pour Vim (commande `:Stdheader`)

---

## 🚀 Installation Rapide

### 1. **Cloner le dépôt**

```bash
git clone https://github.com/Killian0b101010/vim42.git
cd vim42
```

### 2. **Rendre le script exécutable**

```bash
chmod +x install_f42.sh
```

### 3. **Lancer le script**

```bash
./install_f42.sh
```

---

## ✅ **Utilisation**

### 1. **Insérer le Header 42 dans Vim**

Ouvre un fichier avec Vim :

```bash
vim test.c
```

Puis tape dans Vim :

```
:Stdheader
```

✅ Le **header 42** apparaîtra automatiquement.

---

### 2. **Utiliser le Formatter 42**

Crée un fichier C de test :

```bash
echo "int main(){return 0;}" > test.c
```

Formate le fichier avec la commande :

```bash
f42 test.c
```

✅ Le fichier sera **formaté** selon les normes 42.

---

## 🛠️ **Configuration de Vim**

Voici les options ajoutées dans **`.vimrc`** pour améliorer l'expérience :

```vim
set number            " Affiche les numéros de ligne
syntax on             " Active la coloration syntaxique
set tabstop=4         " Définit la largeur des tabulations
set shiftwidth=4      " Définit la largeur de l'indentation
set expandtab         " Convertit les tabulations en espaces
set noerrorbells visualbell t_vb= " Supprime les sons d'erreur

" Raccourcis personnalisés
nnoremap /c :!gcc -Wall -Wextra -Werror % -o %< && ./%<<CR>  " Compile et exécute le fichier courant
nnoremap /s :w!<CR>                                      " Sauvegarde rapide avec /s
nnoremap /q :q!<CR>                                      " Quitter rapidement avec /q
nnoremap /h :Stdheader<CR>                               " Insérer le header 42 avec /h

" Commande pour formater le fichier courant avec c_formatter_42
command! F42 :silent !python3 $HOME/.local/share/c_formatter_42/c_formatter_42.py %
```

### 📖 **Explication des commandes Vim**

- **`set number`** : Affiche les numéros de ligne.
- **`syntax on`** : Active la coloration syntaxique.
- **`set tabstop=4`** : Définit la largeur d'une tabulation à 4 espaces.
- **`set shiftwidth=4`** : Détermine l'indentation automatique à 4 espaces.
- **`set expandtab`** : Remplace les tabulations par des espaces.
- **`set noerrorbells visualbell t_vb=`** : Supprime les bips sonores.

### 🔥 **Raccourcis personnalisés**

- **`/c`** : Compile et exécute le fichier courant avec **GCC** (`gcc -Wall -Wextra -Werror`).
- **`/s`** : Sauvegarder rapidement avec **`/s`**.
- **`/q`** : Quitter rapidement Vim avec **`/q`**.
- **`/h`** : Insérer le **header 42** avec **`/h`**.
- **`:F42`** : Formater le fichier courant avec **`c_formatter_42`**.

---

## 🔄 **Désinstallation Complète**

Pour supprimer tout ce qui a été installé :

```bash
rm -rf ~/.local/share/c_formatter_42
sudo rm -f /usr/local/bin/f42
rm -rf ~/.vim/pack/plugins/start/vim-42header
sed -i '' '/user42/d' ~/.vimrc
sed -i '' '/mail42/d' ~/.vimrc
pip3 cache purge
rm -rf ~/vim42
```

---

## 💪 **Fonctionnalités Incluses**

- ✅ **Formatter 42** accessible via la commande `f42`
- ✅ **Header 42** intégré dans Vim avec `:Stdheader`
- ✅ **Raccourcis Vim** pour compiler, sauvegarder et quitter
- ✅ **Installation 100% automatisée**

---

💎 *Fait avec passion pour simplifier la configuration des outils 42 !*

