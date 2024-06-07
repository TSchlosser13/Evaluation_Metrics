# Makefile


.PHONY: clean

main.pdf: main.tex
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	bibtex main
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<
	pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $<

clean:
	find . \
		! -name "*.bib"    \
		! -name "*.bst"    \
		! -name "*.tex"    \
		! -name "Makefile" \
		-type f -delete

	rm -f main.pdf

