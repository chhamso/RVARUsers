
# https://mran.microsoft.com/
# https://mran.microsoft.com/documents/rro/reproducibility

#library(checkpoint)
#checkpoint("2019-01-01")


install.packages("devtools")
library(devtools)
install_github("andrie/version.compare")
install.packages("knitr")
library("version.compare")
library("knitr")
scale.factor <- 0.1


 r <- c("C:\\Program Files\\Microsoft\\R Open\\R-3.5.2\\bin\\Rscript.exe", "C:\\Program Files\\R\\R-3.5.3\\bin\\Rscript.exe")


#r <- c("C:\\Program Files\\Microsoft\\R Open\\R-3.5.2\\bin\\Rscript.exe")

test.results <- RevoMultiBenchmark(rVersions = r,
                                   threads = c(1, 2, 4),
                                   scale.factor = scale.factor)

kable(test.results)
plot(test.results, theme_size = 8, main = "Elapsed time")

#relative performance

kable(urbanekPerformance(test.results), digits = 2)
plot(urbanekPerformance(test.results), theme_size = 8, main = "Relative Performance")
