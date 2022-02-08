library(dplyr)
library(ggplot2)
library(readr)
library(readxl)
library(RColorBrewer)                                                                                                        
library(tidyr)                                                                                                                                             #importing packages
myData <- readxl::read_xlsx("Control-Velocity.xlsx")                                                                                                       #importing data from excel sheet
data_melt <- pivot_longer(myData, -1)                                                                                                                      #ignoring the first coloumn 'time'                                                                                                      
ggp <- ggplot(data_melt, aes(as.numeric(`Time(in seconds)`), name)) +                                                                                      #Create heatmap with ggplot2 
geom_tile(aes(fill = value)) 
ggp                                                                                                                                                        #Print heatmap

ggp + labs(fill="Velocity(in microns/second)") +                                                                                                           #labeling scale bar
scale_fill_gradientn(colours=c("dark blue","red","orange","yellow")                                                                                        #changing tile colours  
,limits=c(0,1.10))+ ggtitle("Velocity of Autophagosome Movement in Wild-Type")+                                                                            #adjusting limits and editing main title
xlab("Time (in seconds)") + ylab("Autophagosomes")                                                                                                         #axis labels


