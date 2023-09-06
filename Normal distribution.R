setwd('D:/6.Master_data/2020-2022GWAS/1.3表型相关计算/1.正太分布作图')
library(ggplot2)
library(gridExtra)
datax<-read.table("1分布.txt",header = T)
head(datax)

p1<-ggplot(data=datax,aes(FD_BLUE,..density..))+geom_histogram(color='white',fill='#808080',binwidth =1)+
  geom_density(size=1,linetype=5,colour='#000000')+labs(x="FD_BLUE",y="y=f(x)") #?޸?Y????ǩ
p1
ggsave(p1,filename = "FD_BLUE.tiff",width=9,height =12,dpi = 600)
p2<-ggplot(datax,aes(x=HD_20DT))+geom_histogram(color='white',fill='#808080',binwidth =1)+
  geom_density()+labs(x="HD_20DT",y="f(x)") #?޸?Y????ǩ
p2
