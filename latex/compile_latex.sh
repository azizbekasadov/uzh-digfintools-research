#!/bin/bash
pdflatex presentation/presentation.tex
bibtex presentation/presentation
pdflatex report/report.tex
bibtex report/report
