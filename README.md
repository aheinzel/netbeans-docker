# netbeans-docker

```
docker build -t aheinzel/netbeans:17.1 .

docker run \
   -it \
   --rm \
   -e runas="$(id -u):$(id -g)" \
   -e DISPLAY \
   -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
   -v "${HOME}:/home/user" \
   aheinzel/netbeans:17.1
```
