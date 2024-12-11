#!/bin/bash
pdflatex presentation/presentation.tex
bibtex presentation/presentation
pdflatex presentation/presentation.tex
pdflatex presentation/presentation.tex
pdflatex report.tex
bibtex report