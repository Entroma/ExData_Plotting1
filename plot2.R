ds <- read.table('household_power_consumption.txt', na.strings = '?', header = TRUE, sep = ';');

ds$Date <- as.Date(as.character(ds$Date), format = '%d/%m/%Y');

head(ds$Date, n= 5)

nds <- subset.data.frame(ds, subset = ( ( ds$Date == as.Date('02/02/2007', format = '%d/%m/%Y') ) | ( ds$Date == as.Date('01/02/2007', format = '%d/%m/%Y') ) ) )

head(nds, n= 5)

png(filename = 'Plot2.png', width = 480, height = 480)

dt = paste( as.character.Date(nds$Date), as.character(nds$Time) )

x <- as.POSIXct(dt)

y = nds$Global_active_power

plot(x, y,  xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'n')


lines(x, y)

dev.off()
