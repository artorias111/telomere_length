#elegans brood size correlation

library('tidyverse')
library('ggscatter')
library('ggpubr')

broodsize <- read_csv("../data/elegans/correlation_data/brood_size.csv")

eleg_strains <- read_tsv("../data/elegans/lengths/eleg_strain.tsv")

 

bs_merged <- inner_join(broodsize,eleg_strains)

bs_corr <- cor(bs_merged$length,bs_merged$mean_b,method="spearman")

bs_plot <- bs_merged %>% ggplot(aes(x=mean_b,y=length))+
  geom_point()+
  theme_bw()+
  xlab("mean brood size")+
  ylab("telomere length")+
  geom_smooth(method="lm")+
  geom_abline(slope=1, intercept = 0)+
  theme(text = element_text(size=7))
bs_plot + stat_cor(method="pearson")

#ggsave("../plots/cel_broodsize_correlation.png",dpi=300,height=4,width = 4, units = "in")

