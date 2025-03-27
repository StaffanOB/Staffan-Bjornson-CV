SHELL=/bin/bash  # for the while loop below
DOC=sobCV.tex  	 # set the path to your TeX file here
DOC_SV=sobCV_sv.tex  	 # set the path to your TeX file here
GCC=pdflatex	 # Latex compiler

all:  ## Compile paper
	mkdir -p output/
	$(GCC) -output-directory output/ $(DOC)
	$(GCC) -output-directory output/ $(DOC_SV)
	cp output/sobCV.pdf ./'Staffan Bjornson CV.pdf'
	cp output/sobCV_sv.pdf ./'Staffan Bjornson CV - SV.pdf'

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(DOC); sleep 0.01; make all; done

clean:  ## Clean output files
	-rm -f *.aux *.log *.toc *.lof *.lot \
	       *.idx *.ind *.ilg *.out *.bbl *.blg *.brf \
	       *.dvi *.ps

