# Lab 3
# Team: 6
# Team Members:
#   Melvin Zaldivar - Members contribution: 33.33%
#   Rahim Abdulmalik - Members contribution: 33.33%
#   Raul Beiza - Members contribution: 33.33%

# Due Date: February 16, 2020

#--------------------------------------------
# Step 1 Read File
#--------------------------------------------

# Read CSV file
Cust <- read.csv("Lab-3.csv", na.strings = NA)
Cust

# Add Tidyverse
library(tidyverse)

#---------------------------------------------
# Step 2 Organize Data
#---------------------------------------------

# Sort Data
Cust <-Cust %>% 
  arrange(Country)

# Group Data by Country & Summay (France)
cust_fran <- lab_3[1:4,] 
summary(cust_fran)

# Group Data by Country & Summay (Germany)
cust_germ <- lab_3[5:7,] 
summary(cust_germ)

# Group Data by Country & Summay (Spain)
cust_spain <- lab_3[8:10,] 
summary(cust_spain)

# Changing NA values in Age column by computing the feature
# mean grouped by country.
Cust[4,2] <- round(mean(cust_fran$Age,na.rm = TRUE), digits = 1)
Cust[10,2] <- round(mean(cust_spain$Age, na.rm=TRUE), digits = 1)
Cust

# Changing NA Values in Salary column by computing the
# feature mean grouped by country
Cust[6,3] <- round(mean(cust_germ$Salary,na.rm = TRUE))
Cust[8,3] <- round(mean(cust_spain$Salary, na.rm=TRUE), digits = 1)
Cust

# Correcting the the Purchased column with the correct values
# (Yes or No)
Cust[4,4] <- c("Yes")
Cust[9,4] <- c("No")
Cust[10,4] <- c("No")
Cust

#------------------------------------------------
# Step 3 Save File
# ----------------------------------------------

#Creating table and saving as csv file
write.csv(Cust, file = "Lab3_Team6.csv", na = " ")

