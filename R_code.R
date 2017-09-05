
setwd("E://R language//DATA")

DATA=read.csv("data.csv")

head(DATA)

library(ggplot2)
ggplot(data = DATA, aes(x=Year, y=Investment, fill=Countries)) +
  geom_bar(stat='identity', position="dodge")


library(dplyr)

Singapore <- DATA %>%
  filter(Countries=="ÐÂ¼ÓÆÂ")
head(Singapore)

ggplot(Singapore, aes(x=Year, y=Investment))+
  geom_line() +
  geom_text(label=Singapore$Investment, size=3)


Invest14 <- DATA %>%
  filter(Year == "2014")
head(Invest14)

Invest14 <- Invest14 %>%
  mutate(perc = Investment/sum(Investment))
Invest14 = Invest14[order(Invest14$Investment, decreasing = TRUE),]

myLabel = paste(Invest14$Countries, "(", round(Invest14$perc*100,2),"%)", sep = "")
ggplot(Invest14, aes(x="", y=perc, fill=Countries)) +
  geom_bar(stat="identity",width=1) +
  coord_polar(theta = "y") +
  labs(x="",y="",title="") +
  theme(axis.text.x = element_blank()) +
  scale_fill_discrete(breaks=Invest14$Countries, labels=myLabel)
