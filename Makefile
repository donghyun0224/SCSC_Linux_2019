MARPCMD=npx marp
MARPOPT=--html
OPENCMD=xdg-open

all: pdf

preview: Presentation.md
	${MARPCMD} ${MARPOPT} -p $< 

pdf: Presentation.pdf

html: Presentation.html

Presentation.pdf: Presentation.md
	${MARPCMD} ${MARPOPT} --pdf $<

viewpdf: Presentation.pdf
	${OPENCMD} $<

Presentation.html: Presentation.md
	${MARPCMD} ${MARPOPT} $<

viewhtml: html
	${OPENCMD} $<
