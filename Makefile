MARPCMD ?= npx marp
MARPOPT ?= --html
OPENCMD ?= xdg-open

all: pdf html

preview: Presentation.md
	${MARPCMD} ${MARPOPT} -p $< 

.PHONY: clean pdf html preview viewpdf viewhtml

pdf: Presentation.pdf

html: Presentation.html

Presentation.pdf: Presentation.md
	${MARPCMD} ${MARPOPT} --pdf $<

viewpdf: Presentation.pdf
	${OPENCMD} $<

Presentation.html: Presentation.md
	${MARPCMD} ${MARPOPT} $<

viewhtml: Presentation.html
	${OPENCMD} $<

clean: 
	@rm -f *.pdf *html
