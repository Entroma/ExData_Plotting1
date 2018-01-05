ds <- read.table('household_power_consumption.txt', na.strings = '?', header = TRUE, sep = ';');

ds$Date <- as.Date(as.character(ds$Date), format = '%d/%m/%Y');

nds <- subset.data.frame(ds, subset = ( ( ds$Date == as.Date('02/02/2007', format = '%d/%m/%Y') ) | ( ds$Date == as.Date('01/02/2007', format = '%d/%m/%Y') ) ) )

png(filename = 'Plot4.png', width = 480, height = 480)

dt = paste( as.character.Date(nds$Date), as.character(nds$Time) )

x <- as.POSIXct(dt)

par(mfcol = c(2, 2), mar = c(4, 4, 2, 2))

# Plot 2 first

y = nds$Global_active_power

plot(x, y, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'n')

lines(x, y)

#Plot 3 second

plot(x, nds$Sub_metering_1,  xlab = '', ylab = 'Energy sub metering', type = 'n')

points(x, nds$Sub_metering_2, type = 'n')
points(x, nds$Sub_metering_3, type = 'n')


lines(x, nds$Sub_metering_1, col = 'black')
lines(x, nds$Sub_metering_2, col = 'red')
lines(x, nds$Sub_metering_3, col = 'blue')

legend('topright', legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), pch = '_', col = c('black', 'red', 'blue'))

#Voltage plot third
plot(x, nds$Voltage,  xlab = 'datetime', ylab = 'Voltage', type = 'n')

lines(x, nds$Voltage)

#Global avtive power plot last

plot(x, nds$Global_reactive_power,  xlab = 'datetime', ylab = 'Global_reactive_power', type = 'n')

lines(x, nds$Global_reactive_power)

dev.off()

