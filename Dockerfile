FROM cirrusci/flutter:2.0.0

RUN mkdir /srv/app
WORKDIR /srv/app

COPY . .

#docker run --rm -it -v $(pwd)/build-all:/srv/app/build-all nome_imagem /bin/bash
#./build_dev
#./build_prod
