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

#load brig geno
load('../processed_data/trop_geno.Rdata')
load('../processed_data/brig_fgeno.Rdata')
load('../processed_data/cb_len_isotype.Rdata')
load('../processed_data/brig_pop_boxplot.Rdata')
load('../processed_data/cbrqx9181_model.Rdata')

#cbraex5 <- brig_geno %>% dplyr::filter(POS> 14772969 & POS<14776918) %>% dplyr::filter(CHROM=="I")
#14773148 14774170 14774267 14775257 14775484 14775513 14775637 14775661 14775676 14775678 14775823 14776140 14776296

cbraex5 <- brig_fgeno %>% filter(POS==14775257) %>% filter(CHROM==1)
                                   #POS==14774170|
                                   #POS==14774267|
                                  #POS==14773148 |   
                                   #POS==14775484|
                                   #POS==14775513|
                                   #POS==14775637|
                                   #POS==14775661|
                                   #POS==14775676|
                                   #POS==14775678|
                                   #POS==14775823|
                                   #POS==14776140|
                                   #POS==14776296) %>% filter(CHROM==1)
brig_temp1 <- cbraex5 %>% pivot_longer(
    cols=!CHROM & !POS & !REF & !ALT,
    names_to = "isotype",
    values_to = "altref"
)
#brig_temp <- brig_temp1 %>% inner_join(cb_len_isotype) %>% filter(altref==1) %>% dplyr::select(POS,length,isotype)
brig_temp <- brig_temp1 %>% inner_join(cb_len_isotype) 
variant_boxplot <- brig_temp %>% ggplot(aes(x=altref,y=length,group=altref))+
  geom_boxplot() +
  ylim(0,15)

variant_boxplot


cbraex5_plot <- brig_temp %>% ggplot(aes(x=POS,y=length,group=POS)) + 
  geom_boxplot(width=35) + 
  #scale_x_continuous(breaks=c(14670406,14672327,14673372,14673503,14673745,14674803,14676169),lim=c(14669282,14679748))+
  scale_x_continuous(lim=c(14772969,14776918))+
  #geom_jitter(color="black", alpha=0.5) + 
  #theme(axis.title = element_blank(), legend.position = "none",axis.text.x = element_text(angle = 60, vjust = 1, hjust = 1))+
  theme(axis.title = element_blank(), legend.position = "none")+
  ylim(0,15)
  #geom_hline(yintercept=3.68,color='blue')


  #geom_vline(xintercept = c(14669282,14679748,14669282,14671667,14676069,14676749,14677416,14677725,14679067,14679211,14670011,14671846,14676265,14676905,14677619,14677823,14679164,14679748),linetype="dashed",alpha=0.5)
  #geom_vline(xintercept = c(14670406,14672327,14673372,14673503,14673745,14674803,14676169),linetype="dashed",alpha=0.5)

#cbraex5_plot

p <- plot_grid(cbrqx9181_model,cbraex5_plot,ncol=1, align='v',rel_widths=c(1,1),rel_heights = c(1,12))
x <- plot_grid(NULL,brig_pop_plot,ncol=1,align='v',rel_widths=c(1,1),rel_heights = c(1,12))




#ggsave("../plots/cbraex5_boxplot.png",dpi=300,height=4,width = 8, units = "in")
#ggsave("../plots/cbraex5_boxplot_high_impact.png",dpi=300,height=4,width = 8, units = "in")

q <- plot_grid(p,x,rel_widths = c(3,1))
q
#ggsave("../plots/cbrqx9181_boxplot_highimpact.png",dpi=300,height=4,width = 12, units = "in")




#### data for t test

alt_list <- brig_temp %>% filter(altref==1) %>% dplyr::select(length)
ref_list <- brig_temp %>% filter(altref==-1) %>% dplyr::select(length) 

t.test(alt_list,ref_list)

