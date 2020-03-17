pushd "%~dp0"
docker build . -t quasar_test
docker run -p 8443:8443 -p 8080:8080 -p 9005:9005 -p 3000:3000 -it quasar_test /bin/bash
pause > nul