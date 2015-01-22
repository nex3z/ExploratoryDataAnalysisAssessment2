library(lattice)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorSCC <- grep("motor", SCC$Short.Name, ignore.case = TRUE)

data <- subset(NEI, fips == "24510" | fips == "06037")
motorData <- data[data$SCC %in% SCC[motorSCC, ]$SCC, ]

emissions <- aggregate(Emissions ~ year + fips, data=motorData, sum)

colors <- "darkgreen"
symbols <- c(1:2)
linetype <- c(1:2)
key <- list(space="right", text=list(c("Los Angeles County", "Baltimore City")), 
            points=list(pch=symbols, col=symbols)) 

xyplot(Emissions~year, data=emissions, group=fips, type = "o", key=key, 
       main="Total PM2.5 Emissions from Moto Vehicle", 
       xlab="Year", ylab="Emissions (tons)")


dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()
