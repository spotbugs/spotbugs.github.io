#!/bin/bash -xe

docker build -t spotbugs-sphinx .
rm -rf .build

# extract messages from base document (en) to .pot files
docker run -it -v $(pwd):/documents spotbugs-sphinx make gettext

# create .po files by new .pot files
docker run -it -v $(pwd):/documents spotbugs-sphinx sphinx-intl update -p .build/locale -l ja

# make HTML files for each language
rm -rf manual/en && mkdir -p manual/en
rm -rf manual/ja && mkdir -p manual/ja

docker run -it -v $(pwd):/documents spotbugs-sphinx make html
cp -R .build/html manual/en/latest
cp -R .build/html manual/en/3.1

docker run -it -v $(pwd):/documents spotbugs-sphinx make -e SPHINXOPTS="-D language='ja'" html
cp -Rf .build/html manual/ja/latest
cp -Rf .build/html manual/ja/3.1
