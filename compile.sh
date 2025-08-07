#!/bin/bash

# Script de compilation pour main.tex
# Ce script compile le document LaTeX avec bibliographie

echo "🔧 Compilation du document LaTeX..."

# Première compilation LaTeX
echo "📄 Première compilation LaTeX..."
pdflatex -interaction=nonstopmode main.tex

# Compilation de la bibliographie avec biber
echo "📚 Compilation de la bibliographie avec biber..."
biber main

# Deuxième compilation LaTeX (pour les références croisées)
echo "📄 Deuxième compilation LaTeX..."
pdflatex -interaction=nonstopmode main.tex

# Troisième compilation LaTeX (pour finaliser les références)
echo "📄 Troisième compilation LaTeX..."
pdflatex -interaction=nonstopmode main.tex

echo "✅ Compilation terminée ! Le fichier PDF est : main.pdf"

# Nettoyage des fichiers temporaires (optionnel)
echo "🧹 Nettoyage des fichiers temporaires..."
rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.synctex.gz *.toc

echo "🎉 Processus terminé avec succès !"
