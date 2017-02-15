#!/bin/bash -xe

docker build -t spotbugs-sphinx .
rm -rf .build

# extract messages from base document (en) to .pot files
docker run -it -v $(pwd):/documents spotbugs-sphinx make gettext

# create .po files by new .pot files
docker run -it -v $(pwd):/documents spotbugs-sphinx sphinx-intl update -p .build/locale -l ja

# make HTML files for each directory
rm -rf manual/latest && mkdir -p manual/latest
rm -rf manual/3.1 && mkdir -p manual/3.1

docker run -it -v $(pwd):/documents spotbugs-sphinx make html
cp -R .build/html manual/latest/en
cp -R .build/html manual/3.1/en

docker run -it -v $(pwd):/documents spotbugs-sphinx make -e SPHINXOPTS="-D language='ja'" html
cp -Rf .build/html manual/latest/ja
cp -Rf .build/html manual/3.1/ja
