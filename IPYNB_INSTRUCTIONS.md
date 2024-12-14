
After running the command

```
make run 
```

docker compose and image will run and compile ipynb and latex files. you should use the provided in the output url to access the notebook to browse the results

```
To access the notebook, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/nbserver-7-open.html
    Or copy and paste one of these URLs:
        http://d4e80ad6054a:8888/?token=b484c8dd59691142181cfab56224aec4bfb407151cf67f7a
     or http://127.0.0.1:8888/?token=b484c8dd59691142181cfab56224aec4bfb407151cf67f7a
```

In case of having any issues with `make run` command, use 

```
docker build -t dtffprojectjn .
docker run -it --rm --name dtff-project-jn-container -p 10000:8888 -v $(pwd):/app dtffprojectjn
```
