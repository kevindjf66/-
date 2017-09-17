#change the path to where the data is
setwd("E://R language//DATA")
#read the data file
DATA=read.csv("data.csv")
#display the first 5 lines of data file
head(DATA)
#import ggplot2
library(ggplot2)
#Display China's investment in south-eastern Asia Countries from 2010 to 2014
ggplot(data = DATA, aes(x=Year, y=Investment, fill=Countries)) +
  geom_bar(stat='identity', position="dodge")

#import dylyr package
library(dplyr)
#Built the table of China's investment in Singapore
Singapore <- DATA %>%
  filter(Countries=="Singapore")
head(Singapore)
#Generated the graph
ggplot(Singapore, aes(x=Year, y=Investment))+
  geom_line() +
  geom_text(label=Singapore$Investment, size=3)

#Created a table containing China's investment in different countries in 2014
Invest14 <- DATA %>%
  filter(Year == "2014")
head(Invest14)
#Generated the graph
Invest14 <- Invest14 %>%
  mutate(perc = Investment/sum(Investment))
Invest14 = Invest14[order(Invest14$Investment, decreasing = TRUE),]
#Beautify the graph
myLabel = paste(Invest14$Countries, "(", round(Invest14$perc*100,2),"%)", sep = "")
ggplot(Invest14, aes(x="", y=perc, fill=Countries)) +
  geom_bar(stat="identity",width=1) +
  coord_polar(theta = "y") +
  labs(x="",y="",title="") +
  theme(axis.text.x = element_blank()) +
  scale_fill_discrete(breaks=Invest14$Countries, labels=myLabel)
