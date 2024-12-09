### DOCKER DEPLOYMENT INSTRUCTIONS

**Prerequisites**

**Install Docker Desktop:** Download Docker Desktop for Mac and install it.
**Clone Your GitHub Repository:** Clone your repository locally or ensure the Dockerfile is accessible.

**Project Structure**
```
project/
│
├── Dockerfile
├── requirements.txt (optional, for Python dependencies)
├── Makefile
├── src/
│   ├── main.ipynb
│
└── resources/
```

### Build and Run the Docker Container

**Step 1: Build the Docker Image**
Navigate to your project directory in the terminal and run:
```
docker build -t uzh-digfintools-research
```
**Step 2: Run the Docker Container**
Run the container and map the ports:
```
docker run -p 8888:8888 my-jupyter-project
```
**Step 3: Access the Jupyter Notebook**
Once the container is running, look for a URL in the terminal output, such as:
```
http://127.0.0.1:8888/?token={your_token_here}
```
Then, open this URL in your web browser to access the Jupyter Notebook interface.

**Stopping the Docker Container**

Press Ctrl+C in the terminal to stop the container.
Alternatively, stop it via the Docker Desktop interface.
Troubleshooting

**Dependencies not found:**
Ensure all dependencies are listed in requirements.txt.
Notebook not accessible:
Confirm Docker Desktop is running.
Check the port mapping (-p 8888:8888) and browser URL.
