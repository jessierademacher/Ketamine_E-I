library(readxl)
library(writexl)
library(label4MRI)

data <- read_excel('D:/PROJECTS/HCP_MMP1_in_MNI.xlsx')

regions = c()

for(i in 1:nrow(data)){
  out <- mni_to_region_name(x = as.numeric(data[i,1]), y = as.numeric(data[i,2]), z = as.numeric(data[i,3])) 
  regions[i] = out$aal.label
} 

data_new <- data.frame(region_id=c(1:nrow(data)), name=regions, data)

write_xlsx(data_new, 'D:/PROJECTS/HCP_MMP1_in_AAL.xlsx')
