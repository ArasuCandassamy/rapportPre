# Makefile pour compiler main.tex
# Usage: make ou make all pour compiler, make clean pour nettoyer

# Variables
TEX_FILE = main
PDF_FILE = $(TEX_FILE).pdf
TEX_SOURCE = $(TEX_FILE).tex

# Règle par défaut
all: $(PDF_FILE)

# Compilation complète avec bibliographie
$(PDF_FILE): $(TEX_SOURCE) sample.bib
	@echo "🔧 Compilation de $(TEX_SOURCE)..."
	pdflatex -interaction=nonstopmode $(TEX_FILE)
	biber $(TEX_FILE)
	pdflatex -interaction=nonstopmode $(TEX_FILE)
	pdflatex -interaction=nonstopmode $(TEX_FILE)
	@echo "✅ Compilation terminée ! Fichier généré : $(PDF_FILE)"

# Compilation rapide (sans bibliographie)
quick: $(TEX_SOURCE)
	@echo "🚀 Compilation rapide..."
	pdflatex -interaction=nonstopmode $(TEX_FILE)

# Nettoyage des fichiers temporaires
clean:
	@echo "🧹 Nettoyage des fichiers temporaires..."
	rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.synctex.gz *.toc *.fdb_latexmk *.fls

# Nettoyage complet (inclut le PDF)
cleanall: clean
	rm -f $(PDF_FILE)

# Ouvrir le PDF après compilation (macOS)
view: $(PDF_FILE)
	open $(PDF_FILE)

# Règles qui ne correspondent pas à des fichiers
.PHONY: all quick clean cleanall view

# Aide
help:
	@echo "Commandes disponibles :"
	@echo "  make        - Compilation complète avec bibliographie"
	@echo "  make quick  - Compilation rapide sans bibliographie"
	@echo "  make clean  - Nettoyer les fichiers temporaires"
	@echo "  make view   - Ouvrir le PDF après compilation"
	@echo "  make help   - Afficher cette aide"
