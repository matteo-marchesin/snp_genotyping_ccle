#!/bin/sh

# Usage check
if [ -z "$1" ]; then
  echo "Usage: $0 <DataType> (e.g. RNAseq, WGS, WXS)"
  exit 1
fi

data_type="$1"
list_file="short_${data_type}.txt"
output_dir="$data_type"
log_file="log_Download.log"

# Crea la directory di output se non esiste
mkdir -p "$output_dir"

# Logging data
echo "$(date +%F)" >> "$log_file"

# Download
time_now=$(date +%T)
echo "$time_now : Start Download $data_type List" >> "$log_file"
parallel --tag -j4 --colsep "\t" \
  "../sratoolkit.3.1.0-ubuntu64/bin/prefetch --max-size 50G -O ${output_dir}/{2} {1}" \
  :::: "$list_file" >> "$log_file" 2>&1

# SAM-dump -> BAM
time_now=$(date +%T)
echo "$time_now : SAMdump [$data_type]" >> "$log_file"
parallel --tag -j4 \
  "../sratoolkit.3.1.0-ubuntu64/bin/sam-dump {} | samtools view -b > {.}.bam" \
  ::: ./"$output_dir"/*/*/*.sra 2>> "$log_file"

# Post-processing
time_now=$(date +%T)
echo "$time_now : End Download $data_type List" >> "$log_file"
echo "Check Download and Indexing" >> "$log_file"

sh testThemAll.sh "$data_type" >> "$log_file" 2>&1
ssh indexThemAll2.sh "$data_type" >> "$log_file" 2>&1

time_now=$(date +%T)
echo "$time_now : $data_type Files Downloaded, Checked, Indexed" >> "$log_file"

