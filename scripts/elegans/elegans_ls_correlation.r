#elegans lifespan correlation

library('tidyverse')


healthspan <- read_tsv("../data/elegans/correlation_data/pr_t89_mean.tsv")
lifespan <- read_tsv("../data/elegans/correlation_data/pr_t97_mean.tsv")
lifespan2 <- read_tsv("../data/elegans/correlation_data/life_machine_trait_file.tsv")

raw_data <- read_tsv("../data/elegans/correlation_data/healthspan_lifespan_raw.tsv")

eleg_strains <- read_tsv("../data/elegans/lengths/eleg_strain.tsv")

merged <- inner_join(raw_data,eleg_strains)

ls2_plot <- merged %>% ggplot(aes(x=t89_mean,y=length))+
  geom_point()+
  theme_bw()+
  theme(text = element_text(size=7)) +
  geom_smooth(method="lm")
  xlab("healthspan")+
  ylab("telomere length")
ls2_plot
ggsave("../plots/cel_healthspan_raw.png",dpi=300,height=4,width = 4, units = "in")
 

ls_merged <- inner_join(lifespan,eleg_strains)
ls_plot <- ls_merged %>% ggplot(aes(x=t97_mean,y=length))+
  geom_point()+
  theme_bw()+
  theme(text = element_text(size=7)) +
  xlab("lifespan")+
  ylab("telomere length")
ls_plot
ggsave("../plots2/cel_lifespan1_correlation.png",dpi=300,height=4,width = 4, units = "in")

hs_merged <- inner_join(healthspan,eleg_strains)
hs_plot <- hs_merged %>% ggplot(aes(x=t89_mean,y=length))+
  geom_point()+
  theme_bw()+
  theme(text = element_text(size=7)) +
  geom_smooth(method="lm")+
  xlab("healthspan")+
  ylab("telomere length")
hs_plot
ggsave("../plots/cel_healthspan_correlation1.png",dpi=300,height=4,width = 4, units = "in")
# 
# 
ls2_merged <- inner_join(lifespan2,eleg_strains)
ls2_plot <- ls2_merged %>% ggplot(aes(x=mean_ls,y=length)) +
  geom_point()+
  theme_bw()+
  theme(text = element_text(size=7)) +
  xlab("lifespan")+
  geom_smooth(method="lm")+
  ylab("telomere length")
ls2_plot
ggsave("../plots/cel_lifespan_correlation2.png",dpi=300,height=4,width = 4, units = "in")

