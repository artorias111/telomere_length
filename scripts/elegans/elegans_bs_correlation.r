#elegans brood size correlation

library('tidyverse')
library('ggscatter')

broodsize <- read_csv("../data/elegans/correlation_data/brood_size.csv")

eleg_strains <- read_tsv("../data/elegans/lengths/eleg_strain.tsv")

 

bs_merged <- inner_join(broodsize,eleg_strains)
bs_plot <- bs_merged %>% ggplot(aes(x=mean_b,y=length))+
  geom_point()+
  theme_bw()+
  xlab("mean brood size")+
  ylab("telomere length")+
  theme(text = element_text(size=7))
bs_plot

ggsave("../plots2/cel_broodsize_correlation.png",dpi=300,height=4,width = 4, units = "in")
