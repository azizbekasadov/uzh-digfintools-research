# Configurable variables
IMAGE_NAME = dtffprojectjn
CONTAINER_NAME = dtff-project-jn-container
HOST_PORT = 10000
CONTAINER_PORT = 8888
SRC_NOTEBOOK = src/main.ipynb
OUTPUT_NOTEBOOK = output/main_executed.ipynb

run:
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker stop
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker rm
	docker build -t $(IMAGE_NAME) -f Dockerfile .
	docker run -it --rm --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) -v $(PWD):/app $(IMAGE_NAME)

execute-notebook:
	@docker run --rm -v $(PWD):/app $(IMAGE_NAME) bash -c "jupyter nbconvert --to notebook --execute /app/$(SRC_NOTEBOOK) --output /app/$(OUTPUT_NOTEBOOK)"

#stop:
#	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker stop
#	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker rm

clean:
	-docker rmi $(IMAGE_NAME)

# Variables
LATEX=pdflatex
BIBER=biber
TEXDIR=latex
TEXFILE=main
TEXPRESENTATION=presentation/main
TEXREPORT=report/main

# Default target
all: presentation report

# Compile the presentation
presentation:
	@echo "Compiling presentation..."
	cd $(TEXDIR) && $(LATEX) $(TEXPRESENTATION).tex
	cd $(TEXDIR) && $(BIBER) $(TEXPRESENTATION)
	cd $(TEXDIR) && $(LATEX) $(TEXPRESENTATION).tex
	cd $(TEXDIR) && $(LATEX) $(TEXPRESENTATION).tex

# Compile the report
report:
	@echo "Compiling report..."
	cd $(TEXDIR) && $(LATEX) $(TEXREPORT).tex
	cd $(TEXDIR) && $(BIBER) $(TEXREPORT)
	cd $(TEXDIR) && $(LATEX) $(TEXREPORT).tex
	cd $(TEXDIR) && $(LATEX) $(TEXREPORT).tex

# Clean auxiliary files
clean:
	@echo "Cleaning up..."
	cd $(TEXDIR) && rm -f $(TEXPRESENTATION).aux $(TEXPRESENTATION).bbl $(TEXPRESENTATION).bcf $(TEXPRESENTATION).blg $(TEXPRESENTATION).log
	cd $(TEXDIR) && rm -f $(TEXREPORT).aux $(TEXREPORT).bbl $(TEXREPORT).bcf $(TEXREPORT).blg $(TEXREPORT).log

# Clean everything including PDFs
cleanall: clean
	cd $(TEXDIR) && rm -f $(TEXPRESENTATION).pdf $(TEXREPORT).pdf
