SHELL=/bin/bash  # for the while loop below
DOC=sobCV.tex  	 # set the path to your TeX file here
GCC=pdflatex	 # Latex compiler

all:  ## Compile paper
	$(GCC) -output-directory output/ $(DOC)

clean:  ## Clean output files
	-rm -f *.aux *.log *.toc *.lof *.lot \
	       *.idx *.ind *.ilg *.out *.bbl *.blg *.brf \
	       *.dvi *.ps

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(DOC); sleep 0.01; make all; done
