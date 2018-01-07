#data vis ass3

#install gganimate package
#library(devtools)
#library(RCurl)
#library(httr)
#set_config( config( ssl_verifypeer = 0L ) )
#devtools::install_github("dgrtwo/gganimate")
rm(list = ls(all = TRUE))

library(ggplot2)
library(reshape2)
library(readxl)
library(gganimate)
library(extrafont)
library(scales)
#font_import()
loadfonts(device = "win")
setwd("D:/EMORY/data vis/HW3")

internet_user <- read_excel("Passport_Stats_29-10-2017_0325_GMT.xls", col_types = c("text", "text", "blank", "blank", "blank", "numeric", "numeric", "numeric", "numeric", "numeric", 
                     "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
internet_user1 <- melt(internet_user, id.vars=c("Geography","Category"))
colnames(internet_user1)[3]<-'year'
colnames(internet_user1)[1]<-'Countries'

internet_user1[3]<- as.numeric(levels(internet_user1$year))[internet_user1$year]

abc1 <- ggplot(internet_user1,aes(x=year,y=value,framework=year,cumulative=TRUE))+geom_col(aes(fill=Countries),position="dodge")
abc1 <- abc1+theme_minimal()
abc1 <- abc1+scale_fill_manual(values=c("#FF6347", "#696969")) + 
  theme(legend.position = 'bottom',text=element_text(size=14,  family="Arial"))+labs(x="Year", y="Number of Internet User in Thousands"
        , title = "Internet User Comparison between China and US", 
        subtitle="Looking at China's rapid growth in the past 15 years") + scale_y_continuous(breaks=c(0,200000,400000,600000),
        labels=c(0,200,400,600))
abc1


gganimate(abc1)

