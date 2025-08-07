# Guide de Compilation LaTeX - main.tex

## Prérequis

Votre document LaTeX nécessite une distribution LaTeX complète avec :
- `pdflatex` (compilateur)
- `biber` (pour la bibliographie)
- Les packages LaTeX utilisés (amsmath, graphicx, tikz, etc.)

## Installation de LaTeX sur macOS

### Option 1 : MacTeX (Recommandée - en cours d'installation)
```bash
brew install --cask mactex
```

### Option 2 : BasicTeX (plus léger)
```bash
brew install --cask basictex
# Puis installer les packages manquants avec tlmgr
```

## Méthodes de compilation

### 1. Avec Make (Recommandée)
```bash
cd "Rapport PRE"
make           # Compilation complète
make quick     # Compilation rapide
make clean     # Nettoyer les fichiers temporaires
make view      # Ouvrir le PDF
```

### 2. Avec le script bash
```bash
cd "Rapport PRE"
./compile.sh
```

### 3. Compilation manuelle
```bash
cd "Rapport PRE"
pdflatex -interaction=nonstopmode main.tex
biber main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

### 4. Avec latexmk (si disponible)
```bash
latexmk -pdf -bibtex main.tex
```

## Pourquoi plusieurs compilations ?

1. **Première compilation** : Génère le fichier .aux avec les références
2. **biber** : Traite la bibliographie et crée le .bbl
3. **Deuxième compilation** : Intègre la bibliographie
4. **Troisième compilation** : Finalise toutes les références croisées

## Fichiers générés

- `main.pdf` : Le document final
- `main.aux` : Fichier auxiliaire avec les références
- `main.bbl` : Bibliographie formatée
- `main.bcf` : Fichier de contrôle pour biber
- `main.blg` : Log de biber
- `main.log` : Log de compilation LaTeX
- `main.out` : Signets pour hyperref
- `main.toc` : Table des matières

## Dépannage

### Erreur "command not found"
- Installer MacTeX ou BasicTeX
- Redémarrer le terminal après installation
- Vérifier que `/usr/local/texlive/2024/bin/universal-darwin` est dans le PATH

### Erreur de package manquant
```bash
sudo tlmgr install nom-du-package
```

### Erreur de bibliographie
- Vérifier que `sample.bib` existe
- S'assurer que biber est installé
- Utiliser `bibtex` au lieu de `biber` si nécessaire

## Structure du document

Votre document utilise :
- Classe : `report`
- Bibliographie : `biblatex` avec backend `biber`
- Images : Format PNG/JPG dans le même répertoire
- Packages principaux : amsmath, graphicx, tikz, hyperref

## Commandes VS Code

Si vous utilisez VS Code avec l'extension LaTeX Workshop :
- Ctrl+Alt+B : Compiler
- Ctrl+Alt+V : Voir le PDF
- Ctrl+Alt+C : Nettoyer les fichiers auxiliaires
