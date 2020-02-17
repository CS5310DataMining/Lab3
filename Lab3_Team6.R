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
cust <- read.csv("Lab-3.csv", na.strings = NA)
cust

# Add Tidyverse
library(tidyverse)

#---------------------------------------------------------
# Step 2 Create Summary of Missing and Inconsistent Values
#---------------------------------------------------------

#Missing Values
mv_country <- sum(is.na(cust$Country))
mv_age <- sum(is.na(cust$Age))
mv_salary <- sum(is.na(cust$Salary))
mv_purchased <- sum(is.na(cust$Purchased))

#Inconsistent Values
ic_country <- 0
ic_age <- 0
ic_salary <- 0
ic_purchased <- 3

#Summary Table
sum_mv_iv <- data.frame("Features" = c('Country','Age','Salary','Purchased'),
                        "MV" = c(mv_country,mv_age,mv_salary,mv_purchased),
                        "Percentage Of MV" = c(mv_country/10,mv_age/10,mv_salary/10,mv_purchased/10),
                        "IV" = c(ic_country,ic_age,ic_salary,ic_purchased),
                        "Percentage of IV" = c(ic_country/10,ic_age/10,ic_salary/10,ic_purchased/10),
                        stringsAsFactors = FALSE)
View(sum_mv_iv)

#---------------------------------------------
# Step 2 Organize Data
#---------------------------------------------

# Sort Data
cust <-cust %>% 
  arrange(Country)

# Group Data by Country & Summay (France)
cust_fran <- cust[1:4,] 
summary(cust_fran)

# Group Data by Country & Summay (Germany)
cust_germ <- cust[5:7,] 
summary(cust_germ)

# Group Data by Country & Summay (Spain)
cust_spain <- cust[8:10,] 
summary(cust_spain)

# Changing NA values in Age column by computing the feature
# mean grouped by country.
cust[4,2] <- round(mean(cust_fran$Age,na.rm = TRUE), digits = 1)
cust[10,2] <- round(mean(cust_spain$Age, na.rm=TRUE), digits = 1)
cust

# Changing NA Values in Salary column by computing the
# feature mean grouped by country
cust[6,3] <- round(mean(cust_germ$Salary,na.rm = TRUE))
cust[8,3] <- round(mean(cust_spain$Salary, na.rm=TRUE), digits = 1)
cust

# Correcting the the Purchased column with the correct values
# (Yes or No)
cust[4,4] <- c("Yes")
cust[9,4] <- c("No")
cust[10,4] <- c("No")
cust

#------------------------------------------------
# Step 3 Save File
# ----------------------------------------------

#Creating table and saving as csv file
write.csv(cust, file = "Lab3_Team6.csv", na = " ")
