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
df_HPCs$DateTime <- strptime(paste(df_HPCs$Date, df_HPCs$Time), format = "%d/%m/%Y %H:%M:%S")

#plot and annotate
plot(df_HPCs$DateTime,as.numeric(df_HPCs$Global_active_power),
     type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#make png
dev.copy(png, filename = "plot2.png", height = 480, width = 480)
dev.off()

