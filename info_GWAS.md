# GWAS Annotation 
## GWAS Catalog (Full Release)
```bash
wget -O data/gwas_full.tsv.gz "https://www.ebi.ac.uk/gwas/api/search/downloads/full"
```
## GWAS Filtered for Cancers
Here the  expression pattern used to filter the GWAS annotation dataset and select only SNPs associated with cancer and related neoplasms:  
<pre-wrap  style="white-space: pre-wrap !importan; word-wrap: break-word">
```
\b(cancer|tumou?r|carcinoma|neoplasm|malignan(?:t|cy)?|sarcoma|lymphoma|leukemia|myeloma|glioma|blastoma|melanoma|adenoma|mesothelioma|meningioma|retinoblastoma|seminoma|chondrosarcoma|astrocytoma|hepatoma|teratoma|glioblastoma|neuroblastoma|myeloproliferative|testicular germ cell|prostate-specific antigen|multiple myeloma|wilms tumor|hodgkin|non-hodgkin|nasopharyngeal|thyroid cancer|ovarian cancer|pancreatic cancer|renal cell carcinoma|bladder cancer|esophageal cancer|breast cancer|colorectal cancer|skin cancer|lung cancer|endometrial cancer|cervical cancer|germ cell tumor|hepatic cancer|cholangiocarcinoma|uveal melanoma|b-cell malignanc(?:y|ies)|gastric cancer|adverse response to chemotherapy|response to chemotherapy)\b
```
</pre-wrap>
