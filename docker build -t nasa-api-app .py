DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  80.38kB
Step 1/6 : FROM python:3.9
 ---> edb6b76b75ba
Step 2/6 : WORKDIR /usr/src/app
 ---> Using cache
 ---> 96fd61376057
Step 3/6 : COPY requirements.txt ./
 ---> Using cache
 ---> 979d897c6880
Step 4/6 : RUN pip install --no-cache-dir -r requirements.txt
 ---> Using cache
 ---> 46790c223bd1
Step 5/6 : COPY . .
 ---> ed6c6e304da3
Step 6/6 : CMD ["python", "nasa_api_request.py"]
 ---> Running in db06af1463a7
Removing intermediate container db06af1463a7
 ---> dceb96c11998
Successfully built dceb96c11998
Successfully tagged nasa-api-app:latest

