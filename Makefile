.PHONY: all resume cv pngs clean

SRC = src
OUT = out

all: pngs

$(OUT):
	mkdir -p $(OUT)

resume: $(OUT)/lavond-joseph-resume.pdf
cv: $(OUT)/lavond-joseph-cv.pdf

$(OUT)/%.pdf: $(SRC)/%.tex | $(OUT)
	cd $(SRC) && latexmk -pdf $(<F) && mv $(<F:.tex=.pdf) ../$(OUT)/

pngs: resume cv
	pdftoppm -png $(OUT)/lavond-joseph-resume.pdf $(OUT)/lavond-joseph-resume-page
	pdftoppm -png $(OUT)/lavond-joseph-cv.pdf $(OUT)/lavond-joseph-cv-page

clean:
	cd $(SRC) && latexmk -C && rm -f *.bbl
