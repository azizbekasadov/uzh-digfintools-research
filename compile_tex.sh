#!/bin/bash

# Compile the presentation
echo "Compiling presentation..."
pdflatex presentation/main.tex || { echo "pdflatex failed for presentation/main.tex"; exit 1; }
biber presentation/main || { echo "biber failed for presentation/main"; exit 1; }
pdflatex presentation/main.tex
pdflatex presentation/main.tex

# Compile the report
echo "Compiling report..."
pdflatex report/main.tex || { echo "pdflatex failed for report/main.tex"; exit 1; }
biber report/main || { echo "biber failed for report/main"; exit 1; }
pdflatex report/main.tex
pdflatex report/main.tex

echo "Compilation completed successfully!"