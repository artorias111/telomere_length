#orthofinder - cbrmrt1.2

library("tidyverse")
library("plotly")
library("DT")
library("ggbeeswarm")
library("knitr")
library("ggrepel")
library("genetics")
library("ggnewscale")
library("cowplot")

#

load("../functions/gene_model.Rdata")
load("../processed_data/goi_list.Rdata")

goi_list <- goi_list %>% add_row(
  gene='qx3794',
  chr='IV',
  strand='+',
  txstart=4658249,
  txend=4661255,
  codingstart=txstart,
  codingend=txend,
  numexons=4,
  wbgene='Wb000',
  gene_name=gene,
  biotype='protein_coding',
  exonstarts='4658249,4658950,4659392,4660273',
  exonends='4658454,4659147,4659532,4661255',
  type='transcript'
)

cbr_model <- gene_model(goi_list,'qx3794')
cbr_model
save(cbr_model,file="../processed_data/cbrqx3794_model.Rdata")
