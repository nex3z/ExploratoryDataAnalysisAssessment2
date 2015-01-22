library(lattice)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorSCC <- grep("motor", SCC$Short.Name, ignore.case = TRUE)

data <- subset(NEI, fips == "24510" | fips == "06037")
motorData <- data[data$SCC %in% SCC[motorSCC, ]$SCC, ]

emissions <- aggregate(Emissions ~ year + fips, data=motorData, sum)

lbl <- c(1:2)
key <- list(text=list(c("Los Angeles County", "Baltimore City")), 
            points=list(pch=lbl, col=lbl)) 

xyplot(Emissions~year, data=emissions, group=fips, type = c("o"), pch=lbl, col=lbl, key=key, 
       main="Total PM2.5 Emissions from Moto Vehicle", 
       xlab="Year", ylab="Emissions (tons)", 
       scales=list(x=list(at = seq(1999, 2008, by=3))))

dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()
