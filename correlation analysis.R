# 相关系数
setwd('D:/6.Master_data/2020-2022GWAS/1.3表型相关计算')
dd1<-read.table("QTL表型分组分析验证utf.txt",sep="\t",header = T)
dd<-dd1[,5:14]
dd
cor(dd)
cor(dd,use = "complete.obs")

cor.test(dd[,2],dd[,3])


library(Hmisc)
dd = as.matrix(dd)
rcorr(dd)

# 相关系数可视???
library(PerformanceAnalytics)
chart.Correlation(dd)

library(corrplot)
re = cor(dd,use = "complete.obs")
corrplot(re)


library(GGally)
dd = as.data.frame(dd)
ggpairs(dd)


ggpairs(dd, columns = (1:5),ggplot2::aes(color = dd$Spacing))
