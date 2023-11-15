#!/bin/bash

export root=$1        # Canidae Phocidae or Felidae

#########################################################################

export path=/mnt_volext/cancgi
export pathGenomes=${path}/data/genome_sequences/
export pathResults=${path}/results/whole_genome_alignments/

export TMPDIR=${path}/results/whole_genome_alignments/tmp
mkdir -p ${TMPDIR}

#########################################################################
# Using same species tree for each subalignment 
cp ${pathResults}/species_tree.nh  ${pathResults}/seqFile
echo "" >>  ${pathResults}/seqFile

for sp in Panthera_pardus Panthera_leo Lynx_canadensis Felis_catus Prionailurus_viverrinus Puma_concolor Acinonyx_jubatus Lycaon_pictus Canis_lupus_lupus Canis_lupus_familiaris Nyctereutes_procyonoides Otocyon_megalotis_megalotis Vulpes_vulpes Vulpes_lagopus Leptonychotes_weddellii Mirounga_leonina Neomonachus_schauinslandi Phoca_vitulina Halichoerus_grypus
do
    echo "${sp} ${pathGenomes}/${sp}/genome_sm_clean.fa" >> ${pathResults}/seqFile
done

#########################################################################

docker run -v ${path}:/mnt_volext/cancgi --rm -t quay.io/comparative-genomics-toolkit/cactus:v1.3.0 cactus --maxServiceJobs 5 --maxCores 64 --maxMemory 1400G --defaultDisk 10G --maxDisk 900G --binariesMode local --logFile ${pathResults}/LogFile.txt --workDir ${pathResults}/ ${pathResults}/jobStore ${pathResults}/seqFile ${pathResults}/${root}.hal --root ${root}Anc

#########################################################################
