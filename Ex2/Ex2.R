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
  labs(title = "Suicides per 100000 inhabitants by Sex (2002, Age 55-74 years) in Several Countries",
       x = "Sex",
       y = "Suicides per 100000 inhabitants",
       fill = "Sex") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  ) 
  
