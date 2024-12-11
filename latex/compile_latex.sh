#!/bin/bash
pdflatex presentation/presentation.tex
bibtex presentation/presentation
pdflatex report.tex
bibtex report