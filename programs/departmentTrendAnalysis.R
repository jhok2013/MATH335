#=============================================================================
#James Hough, MATH 335
#Summary:
#   Improve the department_data.xlsx data to accurately show the growth over
#   time by department of RC&W attendance.
#   Steps include;
#     Data cleaning/prep and validation
#     Graphic generation
#Question:
#   What is the growth over time tend by department of RC&W attendance?
#=============================================================================
# Cleaning and Prep
#=============================================================================
#Load necessary libraries
library(tidyverse)
library(ggplot2)
library(readxl)

#Create path for excel file
path <- "C:\\MATH335\\data\\department_data.xlsx"

#Specify sheet name
sheetName <- "RCW_data_long"

#Load file to R
departmentData <- read_xlsx(
  path = path,
  sheet = sheetName,
  col_names = TRUE,
  progress = readxl_progress()
)

#Add column of composite year and semesters
#------------------------------------------
#Create new vector to receive composites
departmentData <- add_column(
  departmentData,
  Semester_Abb = NA
)

#Switch swap winter with year number
switcher <- with(
  data = departmentData,
  Semester == 'Winter'
)

departmentData$Semester_Abb <- ifelse(
  test = switcher,
  yes = paste(
    "WI",
    substr(departmentData$Year, 3, 4),
    sep = ""
  ),
  no = departmentData$Semester_Abb
)

#switch swap fall with year number
switcher <- with(
  data = departmentData,
  Semester == 'Fall'
)

departmentData$Semester_Abb <- ifelse(
  test = switcher,
  yes = paste(
    "FA",
    substr(departmentData$Year, 3, 4),
    sep = ""
  ),
  no = departmentData$Semester_Abb
)

#Switch swap spring with year number
switcher <- with(
  data = departmentData,
  Semester == 'Spring'
)

departmentData$Semester_Abb <- ifelse(
  test = switcher,
  yes = paste(
    "SP",
    substr(departmentData$Year, 3, 4),
    sep = ""
  ),
  no = departmentData$Semester_Abb
)

#Switch NA in count to Zeros
switcher <- with(
  data = departmentData,
  is.na(Count) == TRUE
)

departmentData$Count <- ifelse(
  test = switcher,
  0,
  departmentData$Count
)

#Filter data set to only include relevant columns for graphics
departmentData <- data.frame(
  Department = c(departmentData$Department),
  SemesterAbb = c(departmentData$Semester_Abb),
  Attendance = c(departmentData$Count)
)

#Make case for strings uniform
departmentData$Department <- toupper(departmentData$Department)

#=================================================================
#Graphic generation
#=================================================================
departmentData %>% 
  ggplot(aes(x = SemesterAbb, y = Attendance, colour = Department, group = Department)) +
    geom_line() + 
    geom_point() +
    ggtitle("RC&W Attendance by Department by Semester") + 
    labs(y = "Attendance", x = "Semester")

























