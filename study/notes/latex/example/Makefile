# Makefile for .tex documents

test := test.pdf 

default: $(test)

%.pdf : %.tex Makefile
	@xelatex $(patsubst %.tex, %, $<)
	@xelatex $(patsubst %.tex, %, $<)

latex: test.tex Makefile
	@latex test
	@latex test
	@dvipdf test


clean: 
	@rm -f *.aux *.bbl *.blg *.log *.out *.dvi *.toc *.bak
	@rm -f *.tex~
	@rm -f Makefile~

cleanall: clean
	@rm -f $(test)
