#bcsq gene filtering

library("tidyverse")
library("plotly")
library("DT")
library("ggbeeswarm")
library("knitr")
library("ggrepel")
library("genetics")
library("ggnewscale")
library("cowplot")

eleg_finemapping <- as_tibble(read.delim("../data/elegans/nemascan_runs/Analysis_Results-20220308/Fine_Mappings/Data/length_II_13272357-15257187_bcsq_genes.tsv"))
brig_finemapping <- as_tibble(read.delim("../data/briggsae/nemascan_runs/Analysis_Results-20220308/Fine_Mappings/Data/length_I_14312709-15147409_bcsq_genes.tsv"))

e <- eleg_finemapping %>% filter(VARIANT_IMPACT=="HIGH") %>% arrange(desc(VARIANT_LOG10p)) %>% dplyr::select(GENE_NAME,VARIANT_LOG10p) %>% distinct()

b <- brig_finemapping %>% filter(VARIANT_IMPACT=="HIGH") %>% arrange(desc(VARIANT_LOG10p)) %>% dplyr::select(WBGeneID,VARIANT_LOG10p) %>% distinct()

trop_finemapping1 <- as.tibble(read.delim("../data/tropicalis/nemascan_runs/Analysis_Results-20220516/LOCO/Fine_Mappings/Data/length_I_100021-2795391_bcsq_genes_loco.tsv"))
trop_finemapping2 <- as.tibble(read.delim("../data/tropicalis/nemascan_runs/Analysis_Results-20220516/LOCO/Fine_Mappings/Data/length_II_9937539-12084484_bcsq_genes_loco.tsv"))
trop_finemapping3 <- as.tibble(read.delim("../data/tropicalis/nemascan_runs/Analysis_Results-20220516/LOCO/Fine_Mappings/Data/length_III_1751950-4622839_bcsq_genes_loco.tsv"))

t1 <- trop_finemapping1 %>% filter(VARIANT_IMPACT=="HIGH") %>% arrange(desc(VARIANT_LOG10p)) %>% dplyr::select(GENE_NAME,VARIANT_LOG10p) %>% distinct()
t2 <- trop_finemapping2 %>% filter(VARIANT_IMPACT=="HIGH") %>% arrange(desc(VARIANT_LOG10p)) %>% dplyr::select(GENE_NAME,VARIANT_LOG10p) %>% distinct()
t3 <- trop_finemapping3 %>% filter(VARIANT_IMPACT=="HIGH") %>% arrange(desc(VARIANT_LOG10p)) %>% dplyr::select(GENE_NAME,VARIANT_LOG10p) %>% distinct()


pot2 <- eleg_finemapping %>% filter(CHROM=="II") %>% filter(POS>=14524173 & POS<=14525108) %>% arrange(VARIANT_IMPACT)
aex5 <- brig_finemapping  %>% filter(CHROM=="I") %>% filter(POS>=14669282 & POS<=14679748) %>% arrange(VARIANT_IMPACT) 
maph1 <- brig_finemapping %>% filter(CHROM=="I") %>% filter(POS>= 14772969 & POS<=14776918) %>% arrange(VARIANT_IMPACT) 

m <- maph1 %>%dplyr::filter(VARIANT_IMPACT=="HIGH") %>% dplyr::select(POS) %>% dplyr::distinct()
m

#p <- pot2 %>% dplyr::select(POS,REF,ALT,TRANSCRIPT_BIOTYPE,CONSEQUENCE,VARIANT_IMPACT) %>% dplyr::distinct()
#a <- aex5 %>% dplyr::filter(VARIANT_IMPACT=="HIGH") %>% dplyr::distinct()
#a
#write_tsv(a,'aex_bcsq.tsv')
