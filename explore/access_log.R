library(zoo)
library(lattice)
library(latticeExtra)

Sys.setlocale("LC_TIME", "English_US")
nasa<-read.zoo("traffic-per-minute.log", sep=" ", index=2,
               FUN=function(x) as.POSIXct(strptime(x, "%d/%b/%Y:%R")))
nasa.hourly<-aggregate(nasa, as.POSIXct(cut(time(nasa), "hour")), FUN=mean)

nasa.df<-data.frame(Date=as.Date(time(nasa)),Time=format(time(nasa), "%H:%m"),
                    Requests=coredata(nasa))

# plot(na.approx(merge.zoo(nasa, nasa.hourly)), 
#      plot.type="single", col=c("blue", "red"), lwd=c(1,3),
#      xlab="Time", ylab="Requests per minute")

# legend("topright", c("Actual", "Hourly Average"),
#       lty=c(1,1), lwd=c(1,3), col=c("blue", "red"))
