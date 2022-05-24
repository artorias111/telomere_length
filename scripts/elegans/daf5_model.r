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
  gene='daf5',
  chr='II',
  strand='-',
  txstart=14037470,
  txend=14033956,
  codingstart=14037470,
  codingend=14033956,
  numexons=5,
  wbgene='Wb000',
  gene_name=gene,
  biotype='protein_coding',
  exonstarts='14037470,14036391,14036113,14034595,14033220',
  exonends='14037721,14036506,14036296,14035813,14033956',
  type='transcript'
)

pot2_model <- gene_model(goi_list,'daf5')
pot2_model
save(pot2_model,file="../processed_data/daf5_model.Rdata")

