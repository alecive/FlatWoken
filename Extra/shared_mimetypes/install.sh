#!/bin/sh

cp -i *.xml /usr/local/share/mime/packages

update-mime-database /usr/local/share/mime
