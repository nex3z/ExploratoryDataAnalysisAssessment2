NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorSCC <- grep("motor", SCC$Short.Name, ignore.case = TRUE)

baltimoreData <- subset(NEI, fips =="24510")
motorData <- baltimoreData[baltimoreData$SCC %in% SCC[motorSCC, ]$SCC, ]


emissionsByYear <- tapply(motorData$Emissions, motorData$year, sum)

plot(names(emissionsByYear), emissionsByYear, type="b", ann=FALSE, xaxt='n')
axis(side=1, at=names(emissionsByYear))
title("Total PM2.5 Emissions from Moto Vehicle\n in Baltimore", xlab="Year", ylab="Emissions (tons)")

dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
