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

#load eleg geno
load('../processed_data/eleg_fgeno.Rdata')
load('../processed_data/ce_len_isotype.Rdata')
load('../processed_data/pot2_model.Rdata')
load('../processed_data/eleg_pop_boxplot.Rdata')

#II:14033216..14052304
# high impact variants : (POS==14035732 | POS==14037704)

#celpot2 <- eleg_geno %>% filter(POS>=14850052 & POS<=14855827) %>% filter(CHROM=="II")
celpot2 <- eleg_fgeno %>% filter(POS==14035732 | POS==14037704) %>% filter(CHROM==2)
eleg_temp1 <- celpot2 %>% pivot_longer(
    cols=!CHROM & !POS & !REF & !ALT,
    names_to = "isotype",
    values_to = "altref"
)


eleg_temp <- eleg_temp1 %>% inner_join(ce_len_isotype) %>% filter(altref==1) %>% dplyr::select(POS,length,isotype)

  celpot2_plot <- eleg_temp %>% ggplot(aes(x=POS,y=length,group=POS)) + 
  geom_boxplot(width=250) + 
  #geom_jitter(color="black", alpha=0.1) + 
  xlim(14033216,14052304) + 
  theme_bw()+
  theme(axis.title = element_blank())+
  ylim(0,50)
  #geom_vline(xintercept = c(14524173,14525108),linetype="dashed",alpha=0.5)+
  #geom_vline(xintercept = 14524396,linetype = "dashed", alpha = 0.7,color="red") +
    #annotate(geom="text", x=14524396, y=50, label="F68I",
             color="black") + 
    #annotate(geom="text",x=14524804,y=40, label = "E189K")

p <- plot_grid(pot2_model,celpot2_plot,ncol=1, align='v',rel_widths=c(1,1),rel_heights = c(1,12))
x <- plot_grid(NULL,eleg_pop_plot,ncol=1,align='v',rel_widths=c(1,1),rel_heights = c(1,12))

q <- plot_grid(p,x,rel_widths = c(3,1))
q
#ggsave("../plots/daf5_boxplot.png",dpi=300,height=4,width = 12, units = "in")
