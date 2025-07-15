# SNP Genotyping of Cancer Cell Lines via CCLE and Creation of a Web-Based Tool for Data Exploration  
**Master's Thesis – University of Padova**  
**Data Science MSc Program**

## 📘 Overview

This repository supports my Master's thesis in Data Science at the University of Padova, offering a comprehensive overview of the work conducted during my internship.

> **Title:** *SNP Genotyping of Cancer Cell Lines via CCLE and Creation of a Web-Based Tool for Data Exploration*  
> **Internship Period:** April – December 2024  
> **Host Lab:** Laboratory of Cellular, Computational and Integrative Biology (CIBIO), University of Trento  
> **Internship Supervisor:** Prof. Alessandro Romanel  
> **Thesis Supervisor:** Prof. Chiara Romualdi

## 🎯 Motivation

The motivation behind this work arises from the need for accessible and reliable genotypic information on cancer cell lines.

While large-scale resources like the **Cancer Cell Line Encyclopedia (CCLE)** provide extensive genomic data, **specific SNP-level genotyping is not readily available** in a format that allows easy querying of individual variants. To fill this gap, we developed a curated and searchable SNP genotyping resource tailored for CCLE cell lines.

This tool is especially valuable during the **experimental design phase**, allowing researchers to select appropriate models based on the presence or absence of specific variants, inferred ancestry, or copy number variation (CNV) profiles.

## 🛠️ Internship Goals

1. **Develop a data processing pipeline** for SNP genotyping of CCLE sequencing data:
   - Variant calling and filtering
   - Extraction and organization of SNP data
   - Storage in a structured, queryable database

2. **Create an online resource** integrating:
   - Genotyping data
   - Inferred ancestry
   - Copy number variation (CNV) profiles  
   > 🔗 [Access the web tool here](https://bcglab.cibio.unitn.it/clisgen/)

## 🙋‍♂️ Author
Matteo Marchesin
MSc in Data Science, University of Padova

## 📁 Repository Structure
thesis-project/  
│  
├── notebooks/ # Jupyter notebooks for CCLE data overview  
├── scripts/  
│   ├── bash/# Shell scripts for downloading, quality control, prepocessing, and pileup generation    
<!--│ └── R/ # R scripts to generate the final SNP genotyping database  -->
├── info_GWAS.md # Info about downlond GWAS annotation file and filtering  
└── README.md # Project description and documentation   
