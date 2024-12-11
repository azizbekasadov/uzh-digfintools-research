## Compilation Instructions

### Build the Docker Image:
```
docker build -t latex-compiler .
```

### Run the Container:
```
docker run -it --rm -v $(pwd):/app latex-compiler bash
```

### Compile LaTeX Files Inside the Container:
```
/latex/compile_tex.sh
```
### Verify Outputs:
The compiled PDFs will be available in the latex/report and latex/presentation directories on the host machine.
