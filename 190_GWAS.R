setwd("D:/6.Master_data/2020-2022GWAS/2.2GWAS分析5_3") #???ù???·??
library(grid)  #????û??????install.packages("grid")
library(GAPIT3)
library(data.table)
#myG <- fread("190-filiter.vcf.hmp.txt", head = FALSE) #????hapmap?ļ?
#myGAPIT <- GAPIT(G=myG, output.numerical=TRUE)
myY <- read.table("flblup.txt", head = TRUE, sep="\t")
myGD = fread("GAPIT.Genotype.Numerical.txt", head = TRUE)
myGM <- fread("GAPIT.Genotype.map.txt", head = TRUE)
#Kinship matrix
myKI <- read.csv("GAPIT.Kin.VanRaden.csv",head = FALSE)
#myKI<-data.matrix(myKI1)
#covaraite variables (such as population structure represented by Q matrix or PC)
myCV <- read.table("190_wheat.8.Q", head = TRUE)

MY <- GAPIT(
  Y=myY,
  GD=myGD,
  GM=myGM,
  KI=myKI,
  cv=myCV,
  PCA.total=8,
  model="MLM", 
  file.output =T,
  Random.model=TRUE,
  Multiple_analysis=TRUE)


