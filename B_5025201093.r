# 1

# a
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77) # sebelum aktivitas A
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100) # setelah aktivitas A
data_responden <- data.frame( 
  group = rep(c("sebelum", "sesudah"), each=9),
  saturation = c(x, y)
) 
print(data_responden) # visualisasi tabel data
z <- c(22, 20, 3, 13, 20, 18, 11, 16, 23) # selisih sebelum dan sesudah aktivitas A
sd_selisih <- sd(z)
sd_selisih # standar deviasi selisih sebelum dan sesudah aktivitas A

# b
t.test(x, y, alternative = "greater", var.equal = FALSE) # nilai t (p value)

# c
var.test(x, y) # membandingkan dua variance
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE) 


# 2

install.packages("BSDA")
library(BSDA)

# a
zsum.test(
  mean.x = 23500, 
  sigma.x = 3900,
  n.x = 100, 
  alternative = "greater", 
  mu = 20000, 
  conf.level = 0.95
) # one-sample z test

# b
tsum.test(
  mean.x = 23500, 
  s.x = 3900, 
  n.x = 100
) # one-sample t test

# c
# kesimpulan


# 3

# a
# H0 = 9.50, H1 = 10.98

# b
tsum.test(
  mean.x = 3.64,
  s.x = 1.67,
  n.x = 19,
  mean.y = 2.79,
  s.y = 1.32,
  n.y = 27,
  alternative = "greater",
  var.equal = TRUE
)

# c
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")

# d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

# e

# f


# 4

# a 
dataset_kucing <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dataset_kucing <- read.table("onewayanova.txt",h=T)
dim(dataset_kucing)
head(dataset_kucing)
names(dataset_kucing)
dataset_kucing$Group <- as.factor(dataset_kucing$Group)
dataset_kucing$Group = factor(dataset_kucing$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))
class(dataset_kucing$Group)
grup1 <- subset(dataset_kucing, Group == "kucing oren")
grup2 <- subset(dataset_kucing, Group == "kucing hitam")
grup3 <- subset(dataset_kucing, Group == "kucing putih")

# b
bartlett.test(Length ~ Group, data = dataset_kucing)

# c
qqnorm(grup1$Length)
qqline(grup1$Length)

# d

# e
model1 <- lm(Length~Group, data = dataset_kucing)
anova(model1)
TukeyHSD(aov(model1))

# f
library(ggplot2)
ggplot(dataset_kucing, aes(x = V1, y = V2)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

# 5

# a
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
GTL <- read_csv("GTL.csv")
head(GTL)
str(GTL)
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# d
tukey <- TukeyHSD(anova)
print(tukey)

# e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
write.csv("GTL_summary.csv")
