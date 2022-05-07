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

#

load("../functions/gene_model.Rdata")
load("../processed_data/goi_list.Rdata")

goi_list <- goi_list %>% add_row(
  gene='qx9181',
  chr='I',
  strand='+',
  txstart=14772969,
  txend=14776918,
  codingstart=txstart,
  codingend=txend,
  numexons=6,
  wbgene='Wb000',
  gene_name=gene,
  biotype='protein_coding',
  exonstarts='14772969,14773610,14774516,14775112,14775449,14776694',
  exonends='14773153,14774339,14775022,14775288,14776384,14776918',
  type='transcript'
)

cbrqx9181_model <- gene_model(goi_list,'qx9181')
cbrqx9181_model
save(cbrqx9181_model,file="../processed_data/cbrqx9181_model.Rdata")
