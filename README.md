# spotbugs.github.io

## How to build documents

[Install Docker Engine](https://docs.docker.com/engine/installation/) to your machine, and execute `./build-manual.sh` in this directory. It will build documents in docker container, and save built result to `manual` directory.

## How to translate documents

`./build-manual.sh` generates `.po` files in `source/locale/*/LC_MESSAGES` directory,
and translators need to fill translated sentence into these files.

For detail of i18n process, please refer [Sphinx officual document](http://www.sphinx-doc.org/en/1.5/intl.html).
