SHELL := /bin/bash
PDFLATEX ?= pdflatex
TEXFLAGS ?= -halt-on-error -interaction=nonstopmode -file-line-error
DOC := sobCV.tex
DOC_SV := sobCV_sv.tex
CLASS := sobCV.cls
OUTDIR := output
COVER_LETTER_DIR := cover_letters

COVER_LETTERS := $(wildcard sobCL_*.tex)

.PHONY: all check-tools watch clean

all: check-tools
	mkdir -p "$(OUTDIR)" "$(COVER_LETTER_DIR)"

	# === Compile CVs ===
	"$(PDFLATEX)" $(TEXFLAGS) -output-directory "$(OUTDIR)" "$(DOC)"
	cp "$(OUTDIR)/sobCV.pdf" "Staffan Bjornson CV.pdf"

	"$(PDFLATEX)" $(TEXFLAGS) -output-directory "$(OUTDIR)" "$(DOC_SV)"
	cp "$(OUTDIR)/sobCV_sv.pdf" "Staffan Bjornson CV_se.pdf"

	# Compile and rename all sobCL_*.tex files ===
	@for file in sobCL_*.tex; do \
		[ -f "$$file" ] || continue; \
		name=$${file#sobCL_}; \
		name=$${name%.tex}; \
		"$(PDFLATEX)" $(TEXFLAGS) -output-directory "$(OUTDIR)" "$$file"; \
		cp "$(OUTDIR)/sobCL_$$name.pdf" "$(COVER_LETTER_DIR)/Staffan Bjornson CL - $$name.pdf"; \
	done

check-tools:
	@command -v "$(PDFLATEX)" >/dev/null || { \
		echo "Error: TeX compiler '$(PDFLATEX)' was not found in PATH."; \
		echo "Set PDFLATEX=/path/to/pdflatex or install a TeX distribution."; \
		exit 127; \
	}

watch:  ## Recompile on updates to the source file
	@command -v inotifywait >/dev/null || { \
		echo "Error: inotifywait was not found. Install inotify-tools to use watch."; \
		exit 127; \
	}
	@while true; do inotifywait "$(DOC)" "$(DOC_SV)" "$(CLASS)" Makefile $(COVER_LETTERS) icons; sleep 0.01; $(MAKE) all; done

clean:  ## Clean output files
	cd "$(OUTDIR)" && rm -f *.aux *.log *.toc *.lof *.lot \
	       *.idx *.ind *.ilg *.out *.bbl *.blg *.brf \
		   *.dvi *.ps
