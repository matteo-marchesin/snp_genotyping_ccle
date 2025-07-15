#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <DataType>  (e.g. RNAseq, WGS, WXS)"
  exit 1
fi

for file in $(find ./"$1"/*/*/ -type f -name "*.bam"); do
	#echo $file
	mv $file $(dirname $(dirname $file))
	#echo $(dirname $(dirname $file))
	rm -r $(dirname $file)
done
