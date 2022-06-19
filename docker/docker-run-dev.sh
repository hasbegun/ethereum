docker run -it --rm \
   -v $PWD/projects:/home/developer/projects \
   --name geth-client-dev \
   geth-client-dev /bin/sh
