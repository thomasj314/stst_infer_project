library(datasets)
library(ggplot2)


data("ToothGrowth")
str(ToothGrowth)


## Two types of supp, OJ and VC
summary(ToothGrowth)


## There are 3 type of doses in this data. 0.5, 1.0, 1.5
unique(ToothGrowth$dose)  


##Finding differences between supplements
ggplot(ToothGrowth,aes(supp,len)) + geom_boxplot(aes(fill=supp)) + xlab("Supplement")+ ylab("Tooth length")


#Comparing Tooth length by the amount of doses. 

g <- ggplot(ToothGrowth,aes(x=factor(dose),y=len)) + geom_boxplot(aes(fill=factor(dose))) + 
  xlab("Doses")+ylab("Tooth length")

g + labs(title="Relationship between Tooth length and the amount of doses")



## T-test. looking P-value whether 

##T-test with .5 dose
t.test(len~supp,ToothGrowth[ToothGrowth$dose == .5,])


##T-test with 1.0 dose

t.test(len~supp,ToothGrowth[ToothGrowth$dose == 1,])


##T-test with 2.0 dose
t.test(len~supp,ToothGrowth[ToothGrowth$dose == 2,])
