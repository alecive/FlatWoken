#!/bin/sh

cp -i *.xml /usr/share/mime/packages

update-mime-database /usr/share/mime
