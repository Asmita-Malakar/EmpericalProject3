install.packages("haven")
library(haven)

gdc2 <- read.csv("C:\\Users\\arind\\dataSet.csv")
atlas2 <- read_dta("C:\\Users\\arind\\atlas_training.dta")
View(gdc2)
View(atlas2)


library(tidyverse)

rename(gdc2, place = placeName)
colnames(gdc2)

library(dplyr)
colnames(gdc2) <- gsub('placeName', 'place', colnames(gdc2))
gdcFinal <- merge(gdc2,atlas2,by = "place")
View(gdcFinal)
gdcFinal$Median_Income_Person = gdcFinal$Median_Income_Person/gdcFinal$pop
gdcFinal$pred_error = gdcFinal$kfr_pooled_p25 - gdcFinal$pre

summary(gdcFinal$Median_Income_Person, na.rm = TRUE)
summary(gdcFinal$FertilityRate_Person_Female, na.rm = TRUE)
summary(gdcFinal$Count_Person_BelowPovertyLevelInThePast12Months, na.rm = TRUE)
summary(gdcFinal$CumulativeCount_Vaccine_COVID_19_Administered, na.rm = TRUE)
summary(gdcFinal$Count_CriminalActivities_CombinedCrime, na.rm = TRUE)
summary(gdcFinal$Count_Person_EducationalAttainmentRegularHighSchoolDiploma, na.rm = TRUE)
summary(gdcFinal$Count_Person_IsInternetUser_PerCapita, na.rm = TRUE)
summary(gdcFinal$Count_Person)
summary(gdcFinal$LifeExpectancy_Person)
summary(gdcFinal$UnemploymentRate_Person)

gdcFinal$Count_Person_BelowPovertyLevelInThePast12Months = gdcFinal$Count_Person_BelowPovertyLevelInThePast12Months/gdcFinal$pop
gdcFinal$Count_Person_EducationalAttainmentRegularHighSchoolDiploma = gdcFinal$Count_Person_EducationalAttainmentRegularHighSchoolDiploma/gdcFinal$pop
gdcFinal$Count_Person = gdcFinal$Count_Person/gdcFinal$pop

plot(gdcFinal$kfr_pooled_p25, gdcFinal$Median_Income_Person, xlab = "25th percentile income", ylab = "Median Income")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$FertilityRate_Person_Female, xlab = "25th percentile income", ylab = "Median Income", na.rm = TRUE)
plot(gdcFinal$kfr_pooled_p25, gdcFinal$Count_Person_BelowPovertyLevelInThePast12Months, xlab = "25th percentile income", ylab = "Below Poverty Rate")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$CumulativeCount_Vaccine_COVID_19_Administered, xlab = "25th percentile income", ylab = "Median Income")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$Count_CriminalActivities_CombinedCrime, xlab = "25th percentile income", ylab = "Combined Crime")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$Count_Person_EducationalAttainmentRegularHighSchoolDiploma, xlab = "25th percentile income", ylab = "High School Diploma")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$Count_Person_IsInternetUser_PerCapita, xlab = "25th percentile income", ylab = "Internet User", na.rm = TRUE)
plot(gdcFinal$kfr_pooled_p25, gdcFinal$LifeExpectancy_Person, xlab = "25th percentile income", ylab = "Median Income")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$Count_Person, xlab = "25th percentile income", ylab = "Count Person")
plot(gdcFinal$kfr_pooled_p25, gdcFinal$UnemploymentRate_Person, xlab = "25th percentile income", ylab = "Unemployment Rate")


data_frame2 = data.frame(gdcFinal$Median_Income_Person, gdcFinal$FertilityRate_Person_Female,
                         gdcFinal$Count_Person_BelowPovertyLevelInThePast12Months, gdcFinal$CumulativeCount_Vaccine_COVID_19_Administered,
                         )




