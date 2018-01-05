ds <- read.table('household_power_consumption.txt', na.strings = '?', header = TRUE, sep = ';');

ds$Date <- as.Date(as.character(ds$Date), format = '%d/%m/%Y');

head(ds$Date, n= 5)

nds <- subset.data.frame(ds, subset = ( ( ds$Date == as.Date('02/02/2007', format = '%d/%m/%Y') ) | ( ds$Date == as.Date('01/02/2007', format = '%d/%m/%Y') ) ) )

head(nds, n= 5)

png(filename = 'Plot3.png', width = 480, height = 480)

dt = paste( as.character.Date(nds$Date), as.character(nds$Time) )

x <- as.POSIXct(dt)


plot(x, nds$Sub_metering_1,  xlab = '', ylab = 'Energy sub metering', type = 'n')

points(x, nds$Sub_metering_2, type = 'n')
points(x, nds$Sub_metering_3, type = 'n')


lines(x, nds$Sub_metering_1, col = 'black')
lines(x, nds$Sub_metering_2, col = 'red')
lines(x, nds$Sub_metering_3, col = 'blue')

legend('topright', legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), pch = '_', col = c('black', 'red', 'blue'))

dev.off()
