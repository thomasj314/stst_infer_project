investigate the exponential distribution in R and compare it 
with the Central Limit Theorem. 

##exponential distribution is 1/lambda 

## standard deviation is 1/lambda

lambda <- .2
simul <- 1000
n <- 40

## investigate the distribution of averages of 40 exponentials. 

## Note that I will need to do a thousand simulations. 

sampleMean <- mean(rexp(n,lambda))

ExpectedMean <- data.frame()
ExpectedVar <- data.frame()
for(i in 1:simul){
  ExpectedMean <- rbind(ExpectedMean,mean(rexp(n,lambda)))
}

names(ExpectedMean) <- c("Mean")

mean(ExpectedMean$Mean)

## Theoretical Expectation mean is 1/lambda -> it's 5. as we can see,
## with a thousand simulation done, our sampleMean is also near 5.


sample_variance <- sd(ExpectedMean$Mean)^2

theoretical_variance <- (1/lambda)^2/n


## Distribution. 

hist((ExpectedMean$Mean),freq = FALSE, xlab="Simulation Mean",xlim=c(2,8), ylab="Density",
     main="Distribution", col="yellow")
abline(v=mean(ExpectedMean$Mean),lwd=4,col="red")

##
lines(density(ExpectedMean$Mean),lwd=5,col="blue")


##Normal Distribution 

x <- seq(min(ExpectedMean$Mean),max(ExpectedMean$Mean),length= n*2)
y <- dnorm(x,mean=1/lambda,sd= sqrt(theoretical_variance))
lines(x,y, col="red",lwd = 5)


