ds <- read.table('household_power_consumption.txt', na.strings = '?', header = TRUE, sep = ';');

ds$Date <- as.Date(as.character(ds$Date), format = '%d/%m/%Y');

head(ds$Date, n= 5)

library(sqldf)

nds <- subset.data.frame(ds, subset = ( ( ds$Date == as.Date('02/02/2007', format = '%d/%m/%Y') ) | ( ds$Date == as.Date('01/02/2007', format = '%d/%m/%Y') ) ) )

head(nds, n= 5)

png(filename = 'Plot1.png', width = 480, height = 480)

hist(nds$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
