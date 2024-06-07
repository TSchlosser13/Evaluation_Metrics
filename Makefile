# Makefile


.PHONY: clean

main.pdf: main.tex
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	bibtex main
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<

clean:
	find . -maxdepth 2 \
		! -name "*.bib"      \
		! -name "*.bst"      \
		! -name "*.cls"      \
		! -name "*.dat"      \
		! -name "*.jpg"      \
		! -name "*.md"       \
		! -name "*.pdf"      \
		! -name "*.png"      \
		! -name "*.sty"      \
		! -name "*.tex"      \
		! -name "*.txt"      \
		! -name ".gitignore" \
		! -name "Makefile"   \
		-type f -delete

	rm -f main.pdf main*.png

