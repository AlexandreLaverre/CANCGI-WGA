#!/bin/bash

export sp=$1
export path=/mnt_volext/cancgi
export pathGenomes=${path}/data/genome_sequences
export pathScripts=${path}/scripts/whole_genome_alignments

#########################################################################

if [ -e ${pathGenomes}/${sp}/genome_sm.fa ]; then
    perl ${pathScripts}/cleanup.fasta.names.pl --pathInput=${pathGenomes}/${sp}/genome_sm.fa --pathOutput=${pathGenomes}/${sp}/genome_sm_clean.fa
fi

#########################################################################

if [ -e ${pathGenomes}/${sp}.sm.fa ]; then
    perl ${pathScripts}/cleanup.fasta.names.pl --pathInput=${pathGenomes}/${sp}.sm.fa --pathOutput=${pathGenomes}/${sp}.sm.clean.fa
fi

#########################################################################

