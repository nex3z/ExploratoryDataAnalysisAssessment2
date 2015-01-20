NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsByYear <- tapply(NEI$Emissions, NEI$year, sum)

plot(names(emissionsByYear), emissionsByYear, type="b", ann=FALSE, xaxt='n')
axis(side=1, at=names(emissionsByYear))
title("Total PM2.5 Emissions", xlab="Year", ylab="Emissions (tons)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
