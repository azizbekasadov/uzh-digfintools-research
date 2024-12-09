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

# Compilation of the LaTeX files for presentation and report
# (Assuming `report.tex` and `presentation.tex` are in the project directory)
RUN latexmk -pdf /app/report.tex && bibtex /app/report \
    && latexmk -pdf /app/presentation.tex

# Copy the entire project into the container
COPY . /app

# Set the working directory to the src folder
WORKDIR /app/src

# Switch back to the original user for security
USER ${NB_UID}

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to run when starting the container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
