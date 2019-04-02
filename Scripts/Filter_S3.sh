#!/usr/bin/env bash
source ./configs.sh
echo "Step 3:"
echo "Aligning reads to hg19 Human reference genome with BWA"

# Old RepeatMasker command
#RepeatMasker \
#    -species human \
#    -qq \
#    -pa ${CPU} \
#    ${WORKDIR}/${SAMPLE}_Filter_S2.fasta \
#    -dir ${WORKDIR}

# Docker for RepeatMasker
# https://github.com/robsyme/nextflow-annotate/tree/master/Dockerfiles/RepeatMasker-onbuild
WORKDIR=$(pwd)
docker run \
    -v ${WORKDIR}:/in \
    -w /in \
    repeatmasker \
    RepeatMasker \
        -species human \
        -qq \
        ${SAMPLE}_Filter_S2.fasta \
        -dir .
java -jar WGSparser.jar \
    parseRM \
    ${WORKDIR}/${SAMPLE}_Filter_S2.fasta \
    ${WORKDIR}/${SAMPLE}_Filter_S3.fasta

# Mask any reads with more than three nucleotides masked
$BBMASK \
    in=${WORKDIR}/${SAMPLE}_Filter_S2.fasta \
    out=${WORKDIR}/${SAMPLE}_Filter_S3.fasta


echo "Removing intermediate files"
rm ${WORKDIR}/${SAMPLE}_Filter_S2.fasta.tbl
rm ${WORKDIR}/${SAMPLE}_Filter_S2.fasta.out
rm ${WORKDIR}/${SAMPLE}_Filter_S2.fasta.masked
rm ${WORKDIR}/${SAMPLE}_Filter_S2.fasta.cat.gz
