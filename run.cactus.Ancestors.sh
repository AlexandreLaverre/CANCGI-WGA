#!/bin/bash

export cluster=$1
export restart=$2

#########################################################################

if [ ${cluster} = "cloud" ]; then
    export path=/mnt_volext/cancgi
fi

export pathGenomes=${path}/data/genome_sequences/
export pathResults=${path}/results/whole_genome_alignments/Ancestors

#########################################################################

export TMPDIR=${path}/results/whole_genome_alignments/tmp

if [ -e ${TMPDIR} ]; then
    echo "tmpdir already there"
else
    echo "making directory"
    mkdir ${TMPDIR}
fi

#########################################################################

cp ${pathResults}/Anc_tree.nh  ${pathResults}/seqFile
echo "" >>  ${pathResults}/seqFile

for sp in CanidaeAnc PhocidaeAnc FelidaeAnc
do
    echo "${sp} ${pathGenomes}/${sp}/genome_sm_clean.fa" >> ${pathResults}/seqFile
done

#########################################################################

docker run -v ${path}:/mnt_volext/cancgi --rm -t quay.io/comparative-genomics-toolkit/cactus:v1.3.0 cactus ${restart} --maxServiceJobs 5 --maxCores 63 --maxMemory 1400G --defaultDisk 10G --maxDisk 900G --binariesMode local --logFile ${pathResults}/LogFile.txt --workDir ${pathResults}/ ${pathResults}/jobStore ${pathResults}/seqFile ${pathResults}/Ancestors.hal

#########################################################################
