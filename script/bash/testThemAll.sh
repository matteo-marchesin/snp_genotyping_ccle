#!/bin/sh

# Usage
if [ -z "$1" ]; then
  echo "Usage: $0 <DataType>  (e.g. RNAseq, WGS, WXS)"
  exit 1
fi

data_type="$1"
test_string="000000035615010320000000000652800000617218000020000010000270000300000000000000000000000001c"
log_file="log_test.txt"

# Pulisce (opzionale): 
# > echo "" > "$log_file"

find ./"$data_type" -type f -name "*.bam" | while read -r file; do
    # Prendo gli ultimi 28 byte e li confronto
    file_tail=$(tail -c 28 "$file" | hexdump -v -e '1/1 "%02x"' )
    dir=$(dirname "$file")
    # Controllo se esiste già un .check nella directory
    if ! compgen -G "$dir"/*.check > /dev/null; then
        if [ "$file_tail" = "$test_string" ]; then
            echo "OK    $file"
            echo "----------------------" >> "$log_file"
            echo "$file ---- OK ----" >> "$log_file"
            # creo il file di controllo OK
            echo "ok" > "$dir/done_OK.check"
        else
            echo "KO    $file (tail: $file_tail)"
            echo "----------------------" >> "$log_file"
            echo "$file ---- KO ----" >> "$log_file"
            # creo il file di controllo KO e rinomino il .bam
            echo "ko" > "$dir/done_KO.check"
            mv "$file" "$dir/$(basename "$file" .bam).bam.not"
        fi
    else
        echo "Skipping $file: already tested in $dir"
    fi
done
