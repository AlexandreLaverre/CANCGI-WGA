# CANCGI - WGA

This repository contains the code to produce the whole-genome alignment of Carnivora species used in the study:

**"High prevalence of Prdm9-independent recombination hotspots in placental mammals"**

[Joseph et al. 2023, *PNAS*](https://www.pnas.org/doi/10.1073/pnas.2401973121)

## Project Overview

**1 - Download all the genomes** according to the species table in "data/genome_assemblies.txt".

run "get.genome.assembly.sh" will create a folder for each species containing the genome.

**2 - Clean up** and simplify the names of the scaffolds in each assembly

run "cleanup.fasta.names.sh" for each species

**3 - Get sub-alignment by clade** (Canidae, Phocidae, Felidae) 

run "run.cactus.by.root.sh" for each clade separately will create an alignment (HAL file) per clade using the same topology from "data/species_tree.nh

**4 - Get the root alignment**

run "get.ancestors.genomes.sh" separately for each clade will extract the ancestral genome estimated in the corresponding sub-alignment and convert it to fasta

run "run.cactus.Ancestors.sh" will create the root alignment of the 3 ancestors 

**5 - Obtain the final complete alignment**

run "merge.subAlignment.to.Ancestors.sh" for each clade iteratively adds the sub-alignment to the root alignment at the corresponding ancestral node.


## Citation

If you use this code, please cite:

> J. Joseph, D. Prentout, A. Laverré, T. Tricou, & L. Duret, High prevalence of PRDM9-independent recombination hotspots in placental mammals, Proc. Natl. Acad. Sci. U.S.A. 121 (23) e2401973121, https://doi.org/10.1073/pnas.2401973121 (2024). 
