SHELL=/bin/bash  # for the while loop below
DOC=sobCV.tex  	 # set the path to your TeX file here
DOC_SV=sobCV_sv.tex  	 # set the path to your TeX file here
GCC=pdflatex	 # Latex compiler

COVER_LETTER=$(wildcard sobCL_*.tex)
PDFSRC := $(patsubst sobCL_%.tex,output/sobCL_%.pdf, $(COVER_LETTER))
RENAMED := $(patsubst sobCL_%.tex,Staffan\ Bjornson\ CL\ -\ %.pdf, $(COVER_LETTER))

all:
	mkdir -p output/
	mkdir -p cover_letters/

	# === Compile CVs ===
	$(GCC) -output-directory output/ $(DOC)
	cp output/sobCV.pdf 'Staffan Bjornson CV.pdf'

	$(GCC) -output-directory output/ $(DOC_SV)
	cp output/sobCV_sv.pdf 'Staffan Bjornson CV_se.pdf'

	# Compile and rename all sobCL_*.tex files ===
	@for file in sobCL_*.tex; do \
		[ -f "$$file" ] || continue; \
		name=$${file#sobCL_}; \
		name=$${name%.tex}; \
		$(GCC) -output-directory output/ "$$file"; \
		cp "output/sobCL_$$name.pdf" cover_letters/"Staffan Bjornson CL - $$name.pdf"; \
	done

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(DOC); sleep 0.01; make all; done

clean:  ## Clean output files
	cd output && rm -f *.aux *.log *.toc *.lof *.lot \
	       *.idx *.ind *.ilg *.out *.bbl *.blg *.brf \
		   *.dvi *.ps



