#WHAT IS A FACTOR? (1. Data)
movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)

tail(movies)
str(movies)
summary(movies)

#we want 'Year' to be categorical variable (a FACTOR)

movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#--------------------------
#AESTHETICS (2. Aesthetics)
library(ggplot2)

#Aesthetics tells how to map data
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))

#Add geometry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#Add colour
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre)) +
  geom_point()

#Add size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre, size=Genre)) +
  geom_point()

#Add size - better way
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre, size=BudgetMillions)) +
  geom_point()

#------------------------------
#PLOTTING WITH LAYERS (3. Geometries)

p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=BudgetMillions))

#Points
p + geom_point()

#Lines
p + geom_line()

#Multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#------------------------------------
#OVERRIDING AESTHETICS (2. Aesthetics)

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

#Add geom layer
q + geom_point()

#Overriding aesthetics
#Ex.1
q + geom_point(aes(size=CriticRating))

#Ex.2
q + geom_point(aes(colour=BudgetMillions))

#Ex.3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")

#Ex.4
q+geom_line() + geom_point()
#reduce line size
q + geom_line(size=1) + geom_point()

#-----------------------------------
#MAPPING VS SETTING (2. Aesthetics)
library(ggplot2)

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()


#Add colour
#1. Mapping (what we've done so far)
r + geom_point(aes(colour=Genre))

#2. Setting:
r + geom_point(colour=Genre)

#ERROR: r + geom_point(aes(colour="DarkGreen")) # <--- we are setting new variable
#NO ERROR: r + geom_point(colour="DarkGreen") # <--- we are setting colour

#1. Mapping
r + geom_point(aes(size=BudgetMillions))

#2. Setting
r + geom_point(size=10)

#ERROR: r + geom_point(aes(size = 10))

#WHEN WE WANT TO "SET" WE NEED TO USE "SET" FUNCTION
#WHEN WE WANT TO "MAP" WE NEED TO USE "AES" FUNCTION


#---------------------------
#HISTOGRAMS AND DENSITY CHARTS (3. Geometrics and 4. Statistics)

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#Add colour (setting)
s + geom_histogram(binwidth = 10, fill = "Green")

#Add colour (mapping)
s + geom_histogram(binwidth = 10, aes(fill = Genre))

#Add a border
s + geom_histogram(binwidth = 10, aes(fill = Genre), colour="Black")

#Sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")

#--------------------------------------
#STARTING LAYER TIPS (2. Aesthetics)

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

#Another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating),fill='White',colour='Blue')

#Which way we choose depends on what we need

t + geom_histogram(binwidth = 10, aes(x=CriticRating), fill='White', colour='Blue')

#Skeleton plot
t <- ggplot()

#---------------------------------------
#STATISTICAL TRANSFORMATIONS (4. Statistics)

#Smooths
?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#Boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()

u + geom_boxplot(size = 1.2)
u + geom_boxplot(size=1.2) + geom_point()

#Tip / hack:
u + geom_boxplot(size=1.2) + geom_jitter()

#Another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) #alpha is for transparency

#For "CriticRating"
v <- ggplot(data=movies, aes(x=Genre, y=CriticRating, colour=Genre))
v + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) #alpha is for transparency

#-----------------------------------
#USING FACETS
library(ggplot2)
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="black")
#Facets:                   
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="black") +
  facet_grid(Genre~., scales="free")

#Scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

w + geom_point(size=3)

#Facets:
w + geom_point(size=3) + 
  facet_grid(Genre~.)

w + geom_point(size=3) + 
  facet_grid(.~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

#-----------------------
#COORDINATES
#Today:
#-limits
#-zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50,100)

#won't work well always

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre),colour="Black")+
  ylim(0,50)

#instead - zoom:

n + geom_histogram(binwidth=10, aes(fill=Genre),colour="Black")+
  coord_cartesian(ylim=c(0,50))

#improve previous plot

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#----------------------------------
#PERFECTING BY ADDING THEME

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#Axis labels:
h + xlab("Money Axis") + ylab("Number of Movies")

#Label formatting:
h + xlab("Money Axis") + ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="red", size=30))

#Tick mark formatting:
h + xlab("Money Axis") + ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20))

#Legend formatting:
h + xlab("Money Axis") + ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title=element_text(size=30),
        legend.text = element_text(size=20),
        legend.position=c(1,1), #legend on the top right corner
        legend.justifiation = c(1,1)) #on the top right corner of the plot

#Title:
h + xlab("Money Axis") + ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title=element_text(size=30),
        legend.text = element_text(size=20),
        legend.position=c(1,1), #legend on the top right corner
        legend.justification = c(1,1), #on the top right corner of the plot
        plot.title = element_text(colour="DarkBlue", size=40, family="Courier")) 

#----------------------------------------------------

