#!/bin/bash
# Execute the notebook and save the compiled version
/opt/conda/bin/jupyter nbconvert --execute --to notebook --output /app/compiled_main.ipynb /app/main.ipynb
# Convert the compiled notebook to HTML format
/opt/conda/bin/jupyter nbconvert --to html --output /app/main.html /app/compiled_main.ipynb
# Convert the compiled notebook to PDF format
/opt/conda/bin/jupyter nbconvert --to pdf --output /app/main.pdf /app/compiled_main.ipynb
# Notify the user
echo "Notebook successfully compiled to HTML and PDF."
