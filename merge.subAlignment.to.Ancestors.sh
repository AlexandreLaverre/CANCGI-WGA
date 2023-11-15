#!/bin/bash

export mainAlignment=$1			# Iteratively: Ancestors, Ancestors_Canidae then Ancestors_Canidae_Phocidae
export subAlignment=$2			# Canidae Phocidae or Felidae

export pathResults=/mnt_volext/cancgi/results/whole_genome_alignments/

mkdir -p ${pathResults}/save/
mkdir -p ${pathResults}/Stats/

# Create backup file
cp ${pathResults}/${mainAlignment}.hal ${pathResults}/save/${mainAlignment}.hal

# Combine hal at the Ancestral node
halAppendSubtree --merge ${pathResults}/${mainAlignment}.hal ${pathResults}/${subAlignment}.hal ${subAlignment}Anc ${subAlignment}Anc
mv ${pathResults}/${mainAlignment}.hal ${pathResults}/${mainAlignment}_${subAlignment}.hal


# Check merged hal
halStats {pathResults}/${mainAlignment}_${subAlignment}.hal > ${pathResults}/Stats/${mainAlignment}_${subAlignment}.halStats
halValidate ${pathResults}/${mainAlignment}_${subAlignment}.hal > ${pathResults}/Stats/${mainAlignment}_${subAlignment}.halValidate

