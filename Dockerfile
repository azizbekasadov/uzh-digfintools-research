# FROM python:3.9-slim # basic version min. for the docker container

# # Set the working directory in the container
# WORKDIR /app

# # Copy only the requirements.txt file first for dependency installation
# COPY requirements.txt /app/requirements.txt

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the entire project into the container
# COPY . /app

# # Set the working directory to the src folder
# WORKDIR /app/src

# # Command to run when starting the container
# CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
# Start from a base image with Jupyter and Python support
FROM jupyter/scipy-notebook:python-3.10.8

# Set environment variables
ENV JUPYTER_ENABLE_LAB=no

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements.txt file first for dependency installation
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install LaTeX distribution for compiling presentations and reports
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-full \
    latexmk \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Compilation of the latex files for presentation and report
RUN report report.tex && bibtex report && presentation presentation.tex && presentation presentation.tex

# Copy the entire project into the container
COPY . /app

# Set the working directory to the src folder
WORKDIR /app/src

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to run when starting the container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
