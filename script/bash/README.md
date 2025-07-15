## External Dependencies

This project requires 

**SRA Toolkit v3.1.0** for Ubuntu 64-bit, which provides the `prefetch` (to get the files in .sra format) and `sam-dump` utilities (to finally get the sam file).  
**SAMtools v1.15+**, for converting, indexing  SAM/BAM files.

### Installation

- **Download the archive** from NCBI:
	 ```bash 
	 wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.1.0/sratoolkit.3.1.0-ubuntu64.tar.gz  

- **Install samtools** on Ubuntu  
	```bash
	sudo apt update  
	sudo apt install -y samtools
 - **Download ASEQ** https://bitbucket.org/CibioBCG/aseq/src/master/


### Scripts
   
- **testThemAll.sh** This script automates a simple integrity check on every .bam file under a given data‐type folder (e.g. RNAseq, WGS, WXS). Any BAM whose last 28 bytes match a magic pattern is considered “OK,” otherwise it’s “KO.” . It need a file with a list of SRR to download.  
- **indexThemAll.sh** The script automates the creation of BAM index files (.bai) for all un‐indexed .bam files under a specified data‐type directory.
- **PileUp Analysis** The script automates the pileUp analysis of indexed BAM files
- **cleanAll.sh** Remove all bam files after PileUp Analysis
