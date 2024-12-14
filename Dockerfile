# Start from a base image with Jupyter and Python support
FROM jupyter/scipy-notebook:python-3.10.8

# Set environment variables
ENV JUPYTER_ENABLE_LAB=no

# Switch to the root user to install system-level packages
USER root

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements.txt file first for dependency installation
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install LaTeX distribution for compiling presentations and reports
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    texlive-full \
    latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the entire project into the container
COPY . /app
COPY main.ipynb /app/main.ipynb

# Copy the compile_notebook.sh script into the container
COPY compile_notebook.sh /usr/local/bin/compile_notebook.sh
# COPY compile_latex.sh /usr/local/bin/compile_latex.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/compile_notebook.sh
# RUN chmod +x /usr/local/bin/compile_latex.sh

# Provide a shell script to compile LaTeX files dynamically
RUN echo '#!/bin/bash\n'\
'for texfile in "$@"; do\n'\
'  echo "Compiling $texfile...";\n'\
'  latexmk -pdf -interaction=nonstopmode "$texfile";\n'\
'  bibtex "${texfile%.tex}";\n'\
'  latexmk -pdf -interaction=nonstopmode "$texfile";\n'\
'done' > /usr/local/bin/compile_tex.sh && chmod +x /usr/local/bin/compile_tex.sh

# Switch back to the original user for security
USER ${NB_UID}

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to run when starting the container
CMD ["/bin/bash", "-c", "/usr/local/bin/compile_notebook.sh && /opt/conda/bin/jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]