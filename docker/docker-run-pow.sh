docker run -it --rm \
   -v $PWD/projects:/home/developer/projects \
   --name ethereum-dev \
   geth-client-pow /bin/bash
