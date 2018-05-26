#! /bin/bash


# populates directories /tmp/restore/sums and /tmp/restore/files


goodpath="/tmp/restore/"
checkpath="/usr/syno/synoman/webman/modules"


for fullpath in `find $checkpath -iname "*.png"`; do

relpath=`echo $fullpath | sed -n -e 's/^.*modules//p'`

filespath="$goodpath"files"$relpath"

if [ ! -f $filespath ]; then
mkdir -p $filespath
rmdir $filespath
cp $fullpath $filespath
fi

sumpath="$goodpath"sums"$relpath"

if [ ! -f $sumpath ]; then
mkdir -p $sumpath
rmdir $sumpath
fi
md5sum $fullpath | head -c 32 > $sumpath

done


