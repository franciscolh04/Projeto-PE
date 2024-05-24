install.packages("ggplot2")
install.packages("readxl")
library(ggplot2)
library(readxl)

# Ler dados do ficheiro electricity.xlsx
dados <- read_excel("/Users/franciscoheleno/Documents/Coding/R/Projeto PE/Projeto-PE/Ex3/electricity.xlsx")

# Subconjunto com os dados a partir de 2015
selected <- subset(dados, YEAR >= 2015)