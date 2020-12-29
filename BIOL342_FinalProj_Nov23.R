## do once
install.packages("dplyr")
install.packages("ggpubr")

# do every time
library(dplyr)
library(ggplot2)
library(lme4)
library(lmerTest)
library(visreg)


setwd("~/Desktop/BIOL 342")

dataset <- read.csv("BIOL_FinalProj_Nov23.csv", na.strings = c("-", " ", "n/a", "NA"))

# Frequency table to see if pH depends on type of water and indicator
table(dataset$water, dataset$indicator)

# Visualize data
# boxplot_water_type+pH
library("ggpubr")
library(RColorBrewer)
ggplot(dataset, aes(x = water, y = pH)) + geom_boxplot(alpha=1, fill="#69b3a2") + theme(legend.position ="right") + scale_fill_brewer(palette="BuPu")

# boxplot_indicator+pH
ggplot(dataset, aes(x = indicator, y = pH)) + geom_boxplot(alpha=1, fill="#C95A9F") + theme(legend.position ="right") + scale_fill_brewer(palette="BuPu")

pH.aov2 <- aov(pH ~ indicator + water + indicator:water, data = dataset)
summary(pH.aov2)

