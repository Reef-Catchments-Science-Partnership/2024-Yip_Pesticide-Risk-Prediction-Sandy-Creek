library(ggplot2)
library(ggrepel)
library(readxl)
library(ggpmisc)
library(readxl)

# Load data
up_points <- read_xls("Data/Script_4_Analysis_Plots/points_variables_all_up.xls", header = TRUE)

# Convert data to numeric
up_points$Relative.Sugar = as.numeric(up_points$Relative.Sugar)
up_points$Relative.Conservation = as.numeric(up_points$Relative.Conservation)
up_points$Relative.Urban = as.numeric(up_points$Relative.Urban)
up_points$Relative.Horticulture = as.numeric(up_points$Relative.Horticulture)

#######################################

# Relationships between predicted pesticide risks and the proportion of sugarcane land use
# Proportion of urban land use as colours
sugar_plot <- ggplot(up_points, aes(x = Relative.Sugar, y = MsPAF_rounded, color = Relative.Urban)) +  
  geom_point() +  
  labs(x = "Proportion of sugarcane land use", y = "Predicted pesticide risks (% of species affected)", color = "Proportion of \nurban land use", cex=22) +
  geom_text_repel(aes(label = SegmentID)) +
  theme_minimal() +
  geom_vline(xintercept = 0.55, linetype = "dashed", size = 0.7, colour='red') +
  annotate("text", x=0.74, y=190, label="acceptable threshold - 55%", cex=8, colour='red') +
  scale_color_continuous(breaks = seq(0, 0.5, by = 0.2), limits = c(0, 0.6)) +
  theme(
    axis.title.x = element_text(size = 22),  
    axis.title.y = element_text(size = 22),
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 12),
    legend.title.position = "right",
    legend.position = "bottom",
    legend.spacing.x = unit(1, 'cm'),
    legend.key.width = unit(1.5, 'cm'))
sugar_plot

# Export using the 'Plots' tab, save as image
## Image format: PNG
## Dimension: Width(1300mm), Height(900mm)
## File name: "sugar_plot.png"
## Directory: "Outputs/Script_4_Analysis_Plots"

#######################################

# Relationships between predicted pesticide risks and the proportion of urban land use
urban_plot <- ggplot(up_points, aes(x = Relative.Urban, y = MsPAF_rounded)) +  
  geom_point() +  
  labs(x = "Proportion of urban land use", y = "Predicted pesticide risks (% of species affected)") +
  geom_smooth(method=lm, se=FALSE) +
  stat_poly_eq(use_label(c("eq", "R2")), cex=7) +
  #geom_text_repel(aes(label = SegmentID)) +
  theme_minimal() +
  theme(
    axis.title.x = element_text(size = 22),  
    axis.title.y = element_text(size = 22))
urban_plot

# Export using the 'Plots' tab, save as image
## Image format: PNG
## Dimension: Width(1300mm), Height(900mm)
## File name: "urban_plot.png"
## Directory: "Outputs/Script_4_Analysis_Plots"

#######################################

conservation_plot <- ggplot(up_points, aes(x = Relative.Conservation, y = MsPAF_rounded)) +  
  geom_point() +  
  labs(x = "Proportion of conservation land use", y = "Predicted pesticide risks (% of species affected)") +
  geom_smooth(method=lm, se=FALSE) +
  stat_poly_eq(use_label(c("eq", "R2"))) +
  theme_minimal() +
  theme(
    axis.title.x = element_text(size = 22),  
    axis.title.y = element_text(size = 22))
conservation_plot

# Export using the 'Plots' tab, save as image
## Image format: PNG
## Dimension: Width(1300mm), Height(900mm)
## File name: "conservation_plot.png"
## Directory: "Outputs/Script_4_Analysis_Plots"

#######################################

horticulture_plot <- ggplot(up_points, aes(x = Relative.Horticulture, y = MsPAF_rounded)) +  
  geom_point() +  
  labs(x = "Proportion of horticulture land use", y = "Predicted pesticide risks (% of species affected)") +
  stat_poly_line(method=lm, se=FALSE) +
  stat_poly_eq(use_label(c("eq", "R2"))) +
  theme_minimal() +
  theme(
    axis.title.x = element_text(size = 22),  
    axis.title.y = element_text(size = 22))
horticulture_plot

###################################################

# Export using the 'Plots' tab, save as image
## Image format: PNG
## Dimension: Width(1300mm), Height(900mm)
## File name: "horticulture_plot.png"
## Directory: "Outputs/Script_4_Analysis_Plots"

