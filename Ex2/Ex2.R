install.packages("ggplot2")
library(ggplot2)

# Ler dados do ficheiro master.csv
dados <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv")

# Selecionar dados referentes ao ano de 2002 e ao grupo etário 55-74 years
ano <- 2002
faixa_etaria <- "55-74 years"
selected <- subset(dados, year == ano & age == faixa_etaria)

# Criar o gráfico
ggplot(selected, aes(sex, suicides.100k.pop, color = sex)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  labs(title = "Suicides per 100,000 inhabitants by Sex (2002, Age 55-74 years)",
       x = "Sex",
       y = "Suicides per 100,000 inhabitants",
       fill = "Sex") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
