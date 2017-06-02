CHAPTERS = $(shell find . -type f -name 'chapter*.tex')
APPENDIX = $(shell find . -type f -name 'appendix*.tex')

.PHONY: all clean

all: dissertation.pdf dissertation-coadvisors.pdf

dissertation.pdf: dissertation.tex $(CHAPTERS) $(APPENDIX) newcommands.tex ucdenver-dissertation.cls
	latexmk -gg -pdf -bibtex dissertation.tex

dissertation-coadvisors.pdf: dissertation-coadvisors.tex $(CHAPTERS) $(APPENDIX) newcommands.tex ucdenver-dissertation-coadvisors.cls
	latexmk -gg -pdf -bibtex dissertation-coadvisors.tex

clean:
	latexmk -c dissertation.tex 
	latexmk -c dissertation-coadvisors.tex 
	/bin/rm -f *.spl
	/bin/rm -f *.bbl
