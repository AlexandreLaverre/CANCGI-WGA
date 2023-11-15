#!/bin/bash

export path=/mnt_volext/cancgi
export pathGenomes=${path}/data/genome_sequences/
export pathResults=${path}/results/whole_genome_alignments/


for root in CanidaeAnc PhocidaeAnc FelidaeAnc
do
	mkdir -p ${pathGenomes}/${root}
	hal2fasta ${pathResults}/${root}.hal ${root} > ${pathGenomes}/${root}/genome_sm_clean.fa
done


