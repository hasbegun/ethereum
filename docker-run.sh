docker run -it --rm \
   -v $PWD/projects:/home/developer/projects \
   -p 30303:30303 \
   --name ethereum-dev \
   ethereum-dev /bin/bash