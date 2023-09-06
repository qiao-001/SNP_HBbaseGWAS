setwd('D:/6.Master_data/2020-2022GWAS/2.1GWAS_RESULT/1.1两环境全部基因/1.QTL分组验证/8.13-6QTL！！！！！！/74材料验证')
library(ggplot2)
library(patchwork)
library(RColorBrewer)
library(tidyverse)
library(patchwork)
library(data.table)
library(ggpubr)

data1 <-fread("QTL表型分组分析验证utf-1.txt",header = T )

head(data1)

qtl1d.HD<-data.frame(cbind(data1[,8],data1[,10:13]))
qtl1d.HD3<-filter(qtl1d.HD,qtl1d.HD$Qfd.nwafu_5D.1 =='CTTA'|qtl1d.HD$Qfd.nwafu_5D.1 =='TCCG'|qtl1d.HD$Qfd.nwafu_5D.1 =='TTTG')

#qtl1d.HD3<-filter(qtl1d.HD,qtl1d.HD$Qfd.nwafu_5D.1 =='CCAA'|qtl1d.HD$Qfd.nwafu_5D.1 =='CCGC'|qtl1d.HD$Qfd.nwafu_5D.1 =='GTGC')
qtl1d.HD1<-tidyr::gather(qtl1d.HD3,"EV","Days",-Qfd.nwafu_5D.1)


#??????ͼ
my_comparisons <- list( c("CTTA","TCCG","TTTG"))
WILCOXHD_20HD<-compare_means(Days ~ Qfd.nwafu_5D.1,group.by="EV", data = qtl1d.HD1)


p<-ggboxplot(qtl1d.HD1, x = "EV", y = "Days",
             color = "Qfd.nwafu_5D.1", palette = "jama",add = "jitter")+ 
  stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  ylim(150, 240)+
  theme(legend.position = "right",axis.text.x = element_text(angle=0),axis.text = element_text(size=10))
p1 <- p+stat_compare_means(aes(group=Qfd.nwafu_5D.1), label = "p.signif")

p1

