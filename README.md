![RCSP LOGO_Wide 2 (1)](https://github.com/user-attachments/assets/eb142ac1-314c-4200-985d-612b2d25efb9)


# Fine Scale Pesticide Risk Prediction Based on Land Use
## Project Overview

**Owner/s:** Josie (Yee Hang) Yip and Ryan Turner  
**Project Name:** Fine Scale Pesticide Risk Prediction Based on Land Use

**Date Started:** 19/02/2024  
**Date Last Updated:** 13/11/2024 

### Project Description
The aim of the project is to assess the predictability of using land use data to achieve fine-scale prediction of pesticide mixture risks in waterways. 
The code serves the purpose of preparing data for prediction and validation, as well as for data visualisation. 

## Table of Contents

1. Data
2. Scripts
3. Credits and Acknowledgements
4. Outputs
5. Citation
6. Contact Details

## 1. Data

### Script1_PRM
**Concentration_2024-05-14_17-12.csv**
   - Pesticide concentration data downloaded from Tahbil Water Quality Portal. Format and input into PRM calculator.

**Tidy Format Example.csv**
   - Format reference for the concentration data.

### Script2_LandUse
**LandUse_exportpoints_up.xls**
   - All the files in this folder are the land use data exported from ArcGIS Pro for each 1km points.

### Script3_Validation
**1516added_PRM.csv**
   - Calculated PRM for the site Sandy Creek at Homebush, Sandy Creek at Eton, Sandy Creek South Branch at Downstream Sorbellos Road, and Sandy Creek at Bruce Highway.

**Updated_MDF_PRM.csv**
   - Calculated PRM for Multi-farm Drain at North Eton.

### Script 4_ Plots
**Points_variables_all_up.xls**
   - File containing the predicted pesticide risk, each land use variable, size of catchment, and stream order for each 1km points.


## 2. Scripts
**1. Date check for Josie**  
   - Clean and format water quality monitoring data for the Pesticide Risk Metric calculator.

**2. LU_Format_options.R**  
   - Clean and format land use data for the Land Use Pesticide Risk regression model.

**3. validation_plots.R**  
   - Generate plots for pesticide risk prediction validation.

**4. Plot_finals.R**  
   - Generate plots for analysing the relationship between pesticide risks and other variables.

## 3. Outputs

### Script1_PRM
**Duplicates.csv**
   - Example output for checking duplicates 

**Sandy at Homebush.csv** 
   - Example output of the formatted pesticide concentration data 

### Script2_LandUse
**Upstream_LU.csv**
   - Example output of formatted land use data

### Script3_Validation
**Validation_plots.png**  
- Example output for the validation plots.

### Script 4_ Plots
**Sugar_plot.png**  
   - Relationship plot between predicted pesticide risk and the proportion of sugarcane land use.

**Conservation_plot.png**  
   - Relationship plot between predicted pesticide risk and the proportion of conservation land use.

**Horticulture_plot.png**  
   - Relationship plot between predicted pesticide risk and the proportion of horticulture land use.

**Urban_plot.png**  
   - Relationship plot between predicted pesticide risk and the proportion of urban land use.


## 4. Credits and Acknowledgements 


## 5. Citation
Reef Catchments Science Partnership. (2024). *Yip Pesticide Risk Prediction Sandy Creek*. GitHub. https://github.com/Reef-Catchments-Science-Partnership/2024-Yip_Pesticide-risk-prediction-Sandy-Creek


## 6. Contact Details
Please contact rcsp.info@uq.edu.au for any inquiries related to this repository.
