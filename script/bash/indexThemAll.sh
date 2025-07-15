
#!/bin/sh
if [ -z "$1" ]; then
  echo "Usage: $0 <DataType>  (e.g. RNAseq, WGS, WXS)"
  exit 1
fi

for file in $(find ./"$1"/*/ -type f -name "*.bam"); do
	
	tmp_DIR="$(dirname "$file")" 

	if ! [ -f "$tmp_DIR/*.bam.bai" ]; then

		echo $file >> tmp_file2index.txt
	fi
done

		time_now=$(date +%T)
		echo "$time_now ---- Start Indexing"
		parallel --tag -j8  "samtools index -b {} ; echo indexing {} done " :::: tmp_file2index.txt
		#parallel --tag -j4  "echo indexing {} done " :::: tmp_file2index.txt
		time_now=$(date +%T)
		echo "$time_now ----End Indexing-------------"
		rm tmp_file2index.txt
		echo "**************************************"
