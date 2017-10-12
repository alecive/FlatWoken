#!/bin/sh

for f in *.xml; do
    rm -i /usr/local/share/mime/packages/$f
    echo $f removed
done

update-mime-database /usr/local/share/mime
