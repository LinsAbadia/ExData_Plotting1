#read all of txt
df_HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",  
                     stringsAsFactors = FALSE)
#head(df_HPC)
#dim(df_HPC) #2,075,259 x 9
#table(df_HPC$Date) #1440 per day
#sapply(df_HPC$Date, as.Date) #too long and didn't complete =()

#create subset
df_HPCs <- df_HPC[ which(df_HPC$Date =='1/2/2007' 
                      | df_HPC$Date =='2/2/2007'), ]

#head(df_HPCs)
#table(df_HPCs$Date) #confirm daily count
#dim(df_HPCs) # (1440 + 1440) x 9

#plot on screen
hist(as.numeric(df_HPCs$Global_active_power),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

#make png
dev.copy(png, filename = "plot1.png", height = 480, width = 480)
dev.off()
ßå