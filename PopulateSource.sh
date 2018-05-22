#! /bin/bash


# populates directories /tmp/restore/sums and /tmp/restore/files


goodpath="/tmp/restore/"
checkpath="/usr/syno/synoman/webman/modules"


for fullpath in `find $checkpath -iname "*.png"`; do

relpath=`echo $fullpath | sed -n -e 's/^.*modules//p'`

filespath="$goodpath"files"$relpath"

mkdir -p $filespath
cp -p --parents $fullpath $filespath

sumpath="$goodpath"sums"$relpath"
mkdir -p $sumpath
rmdir $sumpath

md5sum $fullpath | head -c 32 > $sumpath

done


