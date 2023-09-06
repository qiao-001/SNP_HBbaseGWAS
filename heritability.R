library(tidyverse)
library(data.table)
library(lme4)
setwd("E:/9.GWAS/2021GWAS/2020-2022GWAS/1.3表型相关计算/遗传力计算")
d1<-fread("190HD_FD-副本.txt",header=T)
d2<-cbind.data.frame(d1[,1:3])
d3<-cbind(d1[,1],d1[,8:9])
d4<- tidyr::gather(d2,"year","FD",-taxa)

write.csv(d2,file="DTFD.csv")
write.csv(d3,file="NWFD.csv")


phe<-read.csv("DTHD.csv",header = T )
phe<- tidyr::gather(phe,"year","FD",-taxa)
trait <- phe$FD
line <- phe$taxa
#loc <- phe$Loc
year <- phe$year                                     
TRAIT <- as.numeric(trait)
LINE <- as.factor(line)     
#LOC <- as.factor(loc)
YEAR <- as.factor(year)
blup <-lmer(TRAIT~(1|LINE)+(1|YEAR),data=phe)
summary(blup)




