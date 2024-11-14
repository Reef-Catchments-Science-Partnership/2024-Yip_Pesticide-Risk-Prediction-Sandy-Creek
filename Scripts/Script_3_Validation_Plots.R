library(gridExtra)
library(gtable)

setwd("/Users/josie/Library/Mobile Documents/com~apple~CloudDocs/0 Honours/RStudio/Validation/Inputs")
PRM_pred <- read.csv("1516added_PRM.csv")
MFD_pred <- read.csv("Updated_MFD_PRM.csv")

# Set up the frame for the plots
par(mfrow=c(3, 2))

# Validation plot for Sandy Creek at Bruce Highway
Bruce_PRM <- PRM_pred[grep("Sandy Creek at Bruce Highway", PRM_pred$Site.Name), ]
Bruce_plot <- boxplot(Bruce_PRM$Total.PRM,
                      col="white",
                      main="Annual Average Wet Season PRM for Sandy Creek \n at Bruce Highway from 2015/16 to 2018/19", 
                      ylab="% species affected",
                      ylim=c(8,75),
                      cex.main=1.5,
                      cex.lab=1.5)
Bruce_plot <- stripchart(Bruce_PRM$Total.PRM, method="overplot", pch=19,col=4,vertical=TRUE,add=TRUE, cex=1)+
  abline(h=31.295, col="blue", lty=2, lwd=2) +
  abline(h=28.9, col="red", lty=2, lwd=2) +
  text(x=0.64, y=36.9, 'Modelled baseline \nfor Sandy Creek \nat Bruce Highway', col="blue", cex=1.2) +
  text(x=0.64, y=24.5, 'Plane Creek Basin \n baseline', col="red", cex=1.2) +
  text(x=1.05, y=63.2, '2015/16', cex=1, col="#5E5E5E") +
  text(x=1.05, y=61, '2016/17', cex=1, col="#5E5E5E") +
  text(x=1.05, y=36.9, '2017/18', cex=1, col="#5E5E5E") +
  text(x=1.05, y=33.2, '2018/19', cex=1, col="#5E5E5E")


# Validation plot for Sandy Creek at Eton
Eton_PRM <- PRM_pred[grep("Sandy Creek at Eton", PRM_pred$Site.Name), ]
Eton_plot <- boxplot(Eton_PRM$Total.PRM,
                     col="white",
                     main="Annual Average Wet Season PRM for Sandy Creek \n at Eton from 2015/16 to 2017/18", 
                     ylab="% species affected", 
                     ylim=c(8,75),
                     cex.main=1.5,
                     cex.lab=1.5)
Eton_plot <- stripchart(Eton_PRM$Total.PRM, method="overplot", pch=19,col=4,vertical=TRUE,add=TRUE, cex=1)+
  abline(h=36.55, col="blue", lty=2, lwd=2) +
  abline(h=28.9, col="red", lty=2, lwd=2) +
  text(x=0.73, y=40.7, 'Modelled baseline for \nSandy Creek at Eton', col="blue", cex=1.2) +
  text(x=0.73, y=26.4, 'Plane Creek Basin baseline', col="red", cex=1.2) +
  text(x=1.05, y=49.3, '2015/16', cex=1, col="#5E5E5E") +
  text(x=1.05, y=51.9, '2017/18', cex=1, col="#5E5E5E") +
  text(x=1.05, y=63.6, '2016/17', cex=1, col="#5E5E5E")

# Validation plot for Sandy Creek at Homebush
Hb_PRM <- PRM_pred[grep("Sandy Creek at Homebush", PRM_pred$Site.Name), ]
Hb_plot <- boxplot(Hb_PRM$Total.PRM,
                   col="white",
                   main="Annual Average Wet Season PRM for Sandy Creek \n at Homebush from 2012/13 to 2022/23",
                   ylab="% species affected", 
                   ylim=c(8,75),
                   cex.main=1.5,
                   cex.lab=1.5)
Hb_plot <- stripchart(Hb_PRM$Total.PRM, method="overplot", pch=19,col=4,vertical=TRUE,add=TRUE, cex=1) +
  abline(h=30.43, col="blue", lty=2, lwd=2) +
  abline(h=28.9, col="red", lty=2, lwd=2) +
  text(x=0.66, y=36.2, 'Modelled baseline \nfor Sandy Creek \nat Homebush', col="blue", cex=1.2) +
  text(x=0.66, y=25, 'Plane Creek Basin \nbaseline', col="red", cex=1.2) +
  text(x=1.05, y=22.9, '2012/13', cex=1, col="#5E5E5E") +
  text(x=1.05, y=31.9, '2013/14', cex=1, col="#5E5E5E") +
  text(x=1.05, y=48.8, '2014/15', cex=1, col="#5E5E5E") +
  text(x=1.1, y=39.1, '2015/16, 2017/18', cex=1, col="#5E5E5E") +
  text(x=1.05, y=40.2, '2016/17', cex=1, col="#5E5E5E") +
  #text(x=1.05, y=41.1, '2017/18', cex=1, col="#5E5E5E") +
  text(x=1.1, y=37.9, '2018/19, 2021/22', cex=1, col="#999999") +
  text(x=1.05, y=35.1, '2019/20', cex=1, col="#5E5E5E") +
  text(x=1.05, y=42.4, '2020/21', cex=1, col="#5E5E5E") +
  #text(x=1.05, y=37.4, '2021/22', cex=1, col="#5E5E5E") +
  text(x=1.05, y=36.7, '2022/23', cex=1, col="#5E5E5E")

# Validation plot for Sandy Creek South Branch at Downstream Sorbellos Road
Sorb_PRM <- PRM_pred[grep("Sandy Creek South Branch at Downstream Sorbellos Road", PRM_pred$Site.Name), ]
Sorb_plot <- boxplot(Sorb_PRM$Total.PRM,
                     col="white",
                     main="Annual Average Wet Season PRM for Sandy Creek \n South Branch at Downstream Sorbellos Road \n from 2015/16 to 2017/18 and 2021/22 to 2022/23",
                     ylab="% species affected", 
                     ylim=c(8,75),
                     cex.main=1.5,
                     cex.lab=1.5)
Sorb_plot <- stripchart(Sorb_PRM$Total.PRM, method="overplot", pch=19,col=4,vertical=TRUE,add=TRUE, cex=1) +
  abline(h=25.2, col="blue", lty=2, lwd=2) +
  abline(h=28.9, col="red", lty=2, lwd=2) +
  text(x=0.68, y=19.9, 'Modelled baseline for \nSandy Creek at \nDownstream Sorbellos Road', col="blue", cex=1.2) +
  text(x=0.67, y=32.8, 'Plane Creek Basin \n baseline', col="red", cex=1.2) +
  text(x=1.05, y=49.4, '2015/16', cex=1, col="#5E5E5E") +
  text(x=1.05, y=41, '2016/17', cex=1, col="#5E5E5E") +
  text(x=1.05, y=51.5, '2017/18', cex=1, col="#5E5E5E") +
  text(x=1.05, y=20.5, '2021/22', cex=1, col="#5E5E5E") +
  text(x=1.05, y=26.8, '2022/23', cex=1, col="#5E5E5E")

# Validation plot for Multi-farm Drain at North Eton
MFD_plot <- boxplot(MFD_pred$Total.PRM,
                    col="white",
                    main="Annual Average Wet Season PRM for Multi-farm Drain \n at North Eton from 2015/16 to 2020/21",
                    ylab="% species affected", 
                    ylim=c(8,75),
                    cex.main=1.5,
                    cex.lab=1.5)
MFD_plot <- stripchart(MFD_pred$Total.PRM, method="overplot", pch=19,col=4,vertical=TRUE,add=TRUE, cex=1) +
  abline(h=11.58, col="blue", lty=2, lwd=2) +
  abline(h=28.9, col="red", lty=2, lwd=2) +
  text(x=0.75, y=15.7, 'modelled baseline for \n Multi-farm Drain at North Eton', col="blue", cex=1.2) +
  text(x=0.75, y=32.2, 'Plane Creek Basin baseline', col="red", cex=1.2) +
  text(x=1.05, y=54.4, '2015/16', cex=1, col="#5E5E5E") +
  text(x=1.05, y=71.7, '2016/17', cex=1, col="#5E5E5E") +
  text(x=1.05, y=74.3, '2017/18', cex=1, col="#5E5E5E") +
  text(x=1.05, y=61, '2018/19', cex=1, col="#5E5E5E") +
  text(x=1.1, y=57.7, '2019/20, 2020/21', cex=1, col="#5E5E5E")

# Legend
par(mfrow=c(3, 2))
par(xpd=TRUE)
legend(0.6,90,
       inset=c(2, 2),  # Adjust position outside the plot area
       legend=c("Modelled Baseline", "Plane Creek Basin Baseline", "Calculated PRM"), 
       col = c("blue", "red", "blue"),
       lty = c(2, 2, NA),
       lwd = c(2, 2, NA),
       pch = c(NA, NA, 19),
       pt.cex = c(NA, NA, 1.5),
       bty = "n",
       cex = 1.5,
       y.intersp = 0.1 )                         


# Export using the 'Plots' tab, save as image
# Image format: PNG
# Dimension: Width(1000mm), Height(1300mm)
# File name: "validation_plots.png"
# Directory: "/Users/josie/Library/Mobile Documents/com~apple~CloudDocs/0 Honours/RStudio/Validation/Outputs"

