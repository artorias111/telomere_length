# telomere length variations in *Caenorhabditis* nematodes

- run all R scripts from scripts/scripts.Rproj
- data in `/projects/b1059/projects/Shriram/telomere_data`



### Directories

#### data
The data directory is organized according to the species used. 

1. Species (_C. elegans_, _C. briggsae_, _C. tropicalis_, and a `data/common` directory for data that's common to all 3)
2. Each of the 'species' subdirectory is organized as follows: 
   1. gffs : .gff file and the gff file data of specific genes of interest 
   2. goi : genes of interest list, and their genome co-ordinates
   3. lengths : phenotype data obtained from telseq_nf
   4. nemascan_runs : mapping output directory, sorted by date
   5. proteins : fasta files of different proteins of interest
   6. genomes : genome fasta file from Wormbase and/or Quest

#### scripts

#### plots

#### processed_data

#### trees

Contains the .treefile of different protein groups. Can be visualized on https://itol.embl.de