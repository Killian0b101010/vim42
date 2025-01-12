# 📦 Installation Automatisée du Formatter 42 et Header 42

Ce projet installe automatiquement :
- Le **formatter 42** (commande `f42`)
- Le **plugin Header 42** pour Vim (commande `:Stdheader ou /h`)

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

## 🛠️ **Désinstallation Complète**

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
- ✅ **Header 42** intégré dans Vim avec `:Stdheader ou  /h en mode normal`
- ✅ Installation 100% automatisée

---



