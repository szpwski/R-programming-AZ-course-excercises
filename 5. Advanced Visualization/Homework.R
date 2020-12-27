#Read data:
df <- read.csv("homework.csv")

#Fast analysis:
head(df)
summary(df)
str(df)

colnames(df)
colnames(df) <- c("DayOfWeek", "Director","Genre","MovieTitle","ReleaseDate","Studio","AdjustedGrossMill","BudgetMill","GrossMill","IMDbRating",
                  "MovieLensRating","OverseasMill","Overseas","ProfitMill","Profit","RuntimeMin","USMill","GrossUS")


#Visualization:
library(ggplot2)

str(df$Studio)

filter1 <- df$Studio=="Buena Vista Studios" | df$Studio=="Fox" | df$Studio=="Paramount Pictures" |
  df$Studio=="Sony" | df$Studio=="Universal" | df$Studio=="WB"
df1 <- df[filter1,]

filter2 <- df1$Genre=="action" | df1$Genre=="adventure" | df1$Genre=="animation" | 
  df1$Genre=="comedy" | df1$Genre=="drama"
df1 <- df1[filter2,]

p <- ggplot(data=df1, aes(x=Genre,y=GrossUS))

p + geom_jitter(aes(color=Studio, size=BudgetMill)) + geom_boxplot(alpha=0.5) +
  xlab("Gross % US") + ylab("Genre")+
  ggtitle("Domestic Gross % by Genre")+
  theme(axis.title.x = element_text(colour="Blue",size=20),
        axis.title.y = element_text(colour="Blue", size=20),
        
        plot.title = element_text(size=20, hjust=0.5))
