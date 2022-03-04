#read all of txt
df_HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",  
                     stringsAsFactors = FALSE)
#head(df_HPC)
#dim(df_HPC) #2,075,259 x 9

#create subset
df_HPCs <- df_HPC[ which(df_HPC$Date =='1/2/2007' 
                         | df_HPC$Date =='2/2/2007'), ]

#head(df_HPCs)
#table(df_HPCs$Date) #check daily count
#dim(df_HPCs) # (1440 + 1440) x 9

#transform data for plotting
df_HPCs$Datetime <- strptime(paste(df_HPCs$Date, df_HPCs$Time), format = "%d/%m/%Y %H:%M:%S")


#initialise plotting 'grid'
par(mfrow = c(2, 2), mar = c(1,1,1,1)) 

#plot and annotate 'graph' 1 (similar to plot 2)
plot(df_HPCs$DateTime, df_HPCs$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot and annotate 'graph' 2
plot(df_HPCs$DateTime, df_HPCs$Voltage, type="l", xlab="df_HPCs$df_HPCs$Datetime", ylab="Voltage")

#plot and annotate 'graph' 3 (similar to plot 3)
plot(df_HPCs$DateTime, df_HPCs$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df_HPCs$DatTime, df_HPCs$Sub_metering_2, type="l", col="red")
lines(df_HPCs$DateTime, df_HPCs$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), cex = 0.75)

#plot and annotate 'graph' 4
plot(df_HPCs$DateTime, df_HPCs$Global_reactive_power, type="l", 
     xlab="Datetime", ylab="Global_reactive_power")

#make png
dev.copy(png, filename = "plot4.png", height = 480, width = 480)
dev.off()

