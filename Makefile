SHELL=/bin/bash  # for the while loop below
DOC=sobCV.tex  	 # set the path to your TeX file here
GCC=pdflatex	 # Latex compiler

SRC_DIR := .
DEST_DIR := .
PDFS := sobCV.pdf
PDF_TARGS := $(patsubst %,$(DEST_DIR)/output/%,$(PDFS))

all:  ## Compile paper
	$(GCC) -output-directory output/ $(DOC)
	cp output/sobCV.pdf ./'Staffan Bjornson CV.pdf'

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(DOC); sleep 0.01; make all; done

clean:  ## Clean output files
	-rm -f *.aux *.log *.toc *.lof *.lot \
	       *.idx *.ind *.ilg *.out *.bbl *.blg *.brf \
	       *.dvi *.ps

