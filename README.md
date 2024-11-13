# Fine Scale Pesticide Risk Prediction Based on Land Use
## Project Overview

**Owner/s:** Josie (Yee Hang) Yip and Ryan Turner  
**Project Name:** ine Scale Pesticide Risk Prediction Based on Land Use
**Date Started:** 19/02/2024  
**Date Last Updated:** 13/11/2024 
### Project Description
The aim of the project is to assess the predictability of using land use data to achieve fine-scale prediction of pesticide mixture risks in waterways. 
The code serves the purpose of preparing data for prediction and validation, as well as for data visualisation. 

## Table of Contents

1. Inputs
2. Scripts
3. Credits and Acknowledgements
4. Citation
5. Contact Details

## Data

**Concentration_2024-05-14_17-12.csv**
- For Script 1 – formatting pesticide concentration data
- Containing pesticide concentration data downloaded from Tahbil Water Quality Portal. Format and input into PRM calculator.

**Tidy Format Example.csv**
- For Script 1 – formatting pesticide concentration data
- Format reference for the concentration data.

**LandUse_exportpoints_upX**
- For Script 2 – LU_Format
- All the files in this folder are the land use data exported from ArcGIS Pro for each 1km points.

**1516added_PRM.csv**
- For Script 3 – Validation_plots
- Calculated PRM for the site Sandy Creek at Homebush, Sandy Creek at Eton, Sandy Creek South Branch at Downstream Sorbellos Road, and Sandy Creek at Bruce Highway.

**Updated_MDF_PRM.csv**
- For Script 3 – Validation_plots
- Calculated PRM for Multi-farm Drain at North Eton.

**Points_variables_all_up.xls**
- For Script 4 – Plots
- File containing the predicted pesticide risk, each land use variable, size of catchment, and stream order for each 1km points.


## 2. Scripts
1. **Date check for Josie**  
   Clean and format water quality monitoring data for the Pesticide Risk Metric calculator.

2. **LU_Format Options.R**  
   Clean and format land use data for the Land Use Pesticide Risk regression model.

3. **Validation_plots.R**  
   Generate plots for pesticide risk prediction validation.

4. **Plot_finals.R**  
   Generate plots for analysing the relationship between pesticide risks and other variables.

## 3. Credits and Acknowledgements 


## 4. Citation
Reef Catchments Science Partnership. (2024). *Yip Pesticide Risk Prediction Sandy Creek*. GitHub. https://github.com/Reef-Catchments-Science-Partnership/2024-Yip_Pesticide-risk-prediction-Sandy-Creek


## 5. Contact Details
Please contact rcsp.info@uq.edu.au for any inquiries related to this repository.
