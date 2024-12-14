#!/bin/bash

# Compile the presentation using Docker
echo "Compiling presentation..."
docker run --rm -v $(pwd):/workdir texlive/texlive \
  pdflatex -output-directory=/workdir/latex/presentation /workdir/latex/presentation/main.tex || { echo "pdflatex failed for presentation/main.tex"; exit 1; }

# Compile the report using Docker
echo "Compiling report..."
docker run --rm -v $(pwd):/workdir texlive/texlive \
  pdflatex -output-directory=/workdir/latex/report /workdir/latex/report/main.tex || { echo "pdflatex failed for report/main.tex"; exit 1; }

echo "Compilation completed successfully!"
