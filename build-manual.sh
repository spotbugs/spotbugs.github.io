#!/bin/bash -xe

docker build -t spotbugs-sphinx .
rm -rf .build
docker run -it -v $(pwd):/documents spotbugs-sphinx

rm -rf manual/latest && cp -Rf .build/html manual/latest
rm -rf manual/3.1 && cp -Rf .build/html manual/3.1
