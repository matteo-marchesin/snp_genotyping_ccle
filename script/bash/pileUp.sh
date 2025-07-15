#!/bin/sh
# check for path for ASEQ directory (here is used: ../dir_aseq/ASEQ)
# Usage check
if [ -z "$1" ]; then
  echo "Usage: $0 <DataType>  (e.g. RNAseq, WGS, WXS)"
  exit 1
fi

data_type="$1"

# Rotate log monthly
time_month=$(date +%Y_%m)
log_file="logFile_aseq_PileUp_${data_type}_${time_month}.log"

# Start logging: date + time
echo "$(date +%Y_%m_%d)"       >> "$log_file"
echo "$(date +%T) : start PileUp using aseq for $data_type" >> "$log_file"
echo "----- ${data_type} -----"  >> "$log_file"


 parallel --verb   ose --tag -j5 "../dir_aseq/ASEQ  vcf=GRCh37/common_all_20180423_filteredByExon.vcf \
#      bam={} mbq=20 mrq=20 threads=10 \
#      out=results/aseq/${data_type}/" \
#   ::: ../CCLE/"${data_type}"/*/*.bam \
#   >> "$log_file" 2>&1

echo "skipped" >> "$log_file"

echo "$(date +%T) : End PileUp for $data_type" >> "$log_file"
