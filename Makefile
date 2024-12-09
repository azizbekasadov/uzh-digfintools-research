run:
	docker build -t dtffprojectjn -f Dockerfile .
	docker run -it --rm --name dtff-project-jn-container -p 10000:8888 dtffprojectjn 
