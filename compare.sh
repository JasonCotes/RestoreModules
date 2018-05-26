#! /bin/bash



goodpath="/tmp/restore/"
checkpath="/usr/syno/synoman/webman/modules"
logdir="/tmp/restore/"

touch="$logdir"restoremod.log

for fullpath in `find $checkpath -iname "*.png"`; do

current=`md5sum $fullpath | head -c 32`
relpath=`echo $fullpath | sed -n -e 's/^.*modules//p'`
good=`cat "$goodpath"sums"$relpath"`

if [ "$current" == "$good" ]; then
	echo "checked $fullpath" >> "$logdir"restoremod.log;
else
	cp -f "$goodpath"files"$relpath" $fullpath
	echo "$fullpath failed verification attempting restore" >> "$logdir"restoremod.log;
	current=`md5sum $fullpath | head -c 32`
	echo "current = $current" >> "$logdir"restoremod.log;
	echo "good = $good" >> "$logdir"restoremod.log;

fi

done
