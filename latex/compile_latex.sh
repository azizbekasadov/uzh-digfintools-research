#!/bin/bash
pdflatex presentation.tex
bibtex presentation
pdflatex report.tex
bibtex report
