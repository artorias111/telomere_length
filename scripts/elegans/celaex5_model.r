#manhattan plots

library("tidyverse")
library("plotly")
library("DT")
library("ggbeeswarm")
library("knitr")
library("ggrepel")
library("genetics")
library("ggnewscale")
library("cowplot")

load("../processed_data/goi_list.Rdata")
load("../functions/gene_model.Rdata")
#14524173 .. 14525108
goi_list
goi_list <- goi_list %>% add_row(
  gene='celaex5',
  chr='I',
  strand='+',
  txstart=14850052,
  txend=14855827,
  codingstart=14850052,
  codingend=14855827,
  numexons=8,
  wbgene='Wb000',
  gene_name=gene,
  biotype='protein_coding',
  exonstarts='14850052,14851043,14851600,14851754,14852012,14852357,14854622,14855579',
  exonends='14850665,14851140,14851698,14851957,14852168,14852553,14854801,14855827',
  type='transcript'
)

pot2_model <- gene_model(goi_list,'celaex5')
pot2_model
save(pot2_model,file="../processed_data/celaex5_model.Rdata")

