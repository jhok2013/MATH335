library(tidyverse)

#Create path for excel file
path <- "C:\\MATH335\\data\\department_data.xlsx"

#Specify sheet name
sheetName <- "RCW_data_long"

#Load file to R
dat <- read_xlsx(
  path = path,
  sheet = sheetName,
  col_names = TRUE,
  progress = readxl_progress()
)

dat %>% 
  na.omit(Count) %>% 
  ggplot(aes(x = Semester_Date, y = Count, colour = Department, group = Department)) + 
  geom_line() + 
  geom_point() + 
  theme_bw()