#!/bin/bash -l
export PATH=/home/deconti/bin/bowtie2-2.3.5-linux-x86_64/:/home/deconti/bin/samtools-1.9:/home/deconti/bin/blast-2.2.27/bin/
# removed from PATH : /home/user/tools/RepeatMasker/home/user/R/R-3.0.2/bin/:/home/user/R/R-3.0.2/bin/��$PATH

BWA=${HOME}/bin/bwa
BOWTIE2=/home/user/tools/bowtie2-2.2.5/bowtie2
PATHOSCOPE=/home/user/ptools/pathoscope2/pathoscope/pathoscope.py

HUMANHG19="/media/deconti/Data/ddeconti/farline/test_path/ref/hg19_bwa/hs_ref_GRCh37_p10.fa.gz"
HUMANOTHER="/home/user/genomes/human_bwa/human_genomic"
BACTERIA="/home/user/genomes/bowtie2_allbac/bowtie2_allbac"
BLASTHUMANDB="/home/user/genomes/human_blast/human_genomic"

WORKDIR="/media/deconti/Data/ddeconti/farline/test_path/WGSpipe"
SAMPLE="ZH33_WM013A"
CPU=4
MINCOUNTS=50
VAR1=2
VAR2=0.00005