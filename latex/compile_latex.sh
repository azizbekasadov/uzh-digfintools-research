#!/bin/bash
pdflatex presentation/main.tex
bibtex presentation/main
pdflatex report/main.tex
bibtex report/main
