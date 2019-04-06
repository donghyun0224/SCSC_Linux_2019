MARPCMD=npx marp
MARPOPT=--html

all: pdf

preview: Presentation.md
	${MARPCMD} ${MARPOPT} -p $< 

pdf: Presentation.md
	${MARPCMD} ${MARPOPT} --pdf $<

