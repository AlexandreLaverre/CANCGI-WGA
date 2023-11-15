#!/bin/bash

export path=/mnt_volext/cancgi/data
export pathGenomes=${path}/genome_sequences

##################################################
# Download Genbank summary
if [ -f ${path}/assembly_summary_genbank.txt ] ; then
       echo "GenBank summary already here!"
else
       wget -P ${path} https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_genbank.txt
fi


# Download genome assemblies according to species table
cat ${path}/genome_assemblies.txt | while read line
do

export sp_name=`echo "$line" | cut -f 1`
export genome_name=`echo "$line" | cut -f 3`

if [ ${sp_name} != "ScientificName" ] ; then
	echo "################"
	echo ${sp_name}
	mkdir -p ${pathGenomes}/${sp_name}

	if [ -f ${pathGenomes}/${sp_name}/genome_sm.fa ] ; then
		echo "Genome already here!"
	else
		echo ${genome_name}
		export link=`grep -w ${genome_name} ${path}/assembly_summary_genbank.txt | cut -f 20`
		wget ${link}/*${genome_name}_genomic.fna.gz -P ${pathGenomes}/${sp_name}/

		echo "Unzipping..."
		mv ${pathGenomes}/${sp_name}/*.fna.gz ${pathGenomes}/${sp_name}/genome_sm.fa.gz
		gunzip ${pathGenomes}/${sp_name}/genome_sm.fa.gz
	fi
fi
done

##################################################
