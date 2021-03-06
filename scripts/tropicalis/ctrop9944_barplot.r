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
load('../processed_data/ct_len_isotype.Rdata')

#variants in notion

#variants : 4633871,4633917,4634192

ctrop <- trop_geno %>% filter(POS==4634192) %>% filter(CHROM=="IV")
trop_temp1 <- ctrop %>% pivot_longer(
    cols=!CHROM & !POS & !REF & !ALT,
    names_to = "isotype",
    values_to = "altref"
)

iso_list <- trop_temp1 %>% filter(altref==-1) %>% dplyr::select(isotype) %>% distinct() %>% add_column(status=1)
ctrop_strains <- ct_len_isotype %>% mutate(isotype=fct_reorder(isotype,length))

x <- as_tibble(setdiff(ctrop_strains$isotype,iso_list$isotype)) 
y <- x %>% add_column(status=-1)
y <- y %>% dplyr::rename(isotype=value)

z <- full_join(iso_list,y)
k <- inner_join(ct_len_isotype,z)
k <- k %>% mutate(status=as.character(status)) %>% mutate(status=str_replace(status,"-1","alt")) %>% mutate(status=str_replace(status,"1","ref"))

ctrop_bar <- k %>% mutate(isotype=fct_reorder(isotype,length)) %>%
      ggplot(aes(x=isotype,y=length,fill=as.factor(status))) + 
        labs(fill="isotype") + 
        geom_bar(stat='identity') +
        theme(axis.text.x = element_blank(),axis.ticks.x = element_blank()) +
        xlab(expression(paste(italic('C. tropicalis')," isotypes")))+
  ggtitle("IV:4634192")

ctrop_bar
ggsave("../plots/ctrop9944_barplot3.png",dpi=300,height=4,width = 8, units = "in")
