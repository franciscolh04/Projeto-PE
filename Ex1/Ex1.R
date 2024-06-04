install.packages("ggplot2")
library(ggplot2)

# Ler dados do ficheiro Paises_PIB_ICH.csv
dados <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv")

# Países a identificar
continentes <- c("Europe", "Americas")
tag <- c("Lithuania", "Iceland", "United States", "Saint Lucia")

# Data frame para as setas
dados$label_x <- ifelse(dados$Country %in% tag, dados$GDP * 0.99, NA)
dados$label_y <- ifelse(dados$Country %in% tag, dados$HCI * 0.99, NA)

# Gráfico
dados |>
  subset(Continent %in% continentes) |>
  ggplot() +
  geom_point(aes(x = GDP, y = HCI, color = Continent)) +
  scale_x_log10() +
  geom_text(aes(x = GDP, y = HCI, label = ifelse(Country %in% tag, as.character(Country), '')), 
            hjust = 0.5, vjust = 2.7) +
  geom_segment(aes(x = label_x, y = label_y - 0.01, xend = GDP, yend = HCI), 
               arrow = arrow(length = unit(0.2, "cm")), color = "black", na.rm = TRUE) +
  labs(title = paste("HCI as a function of GDP per Capita"),
       x = "GDP per Capita (log scale)",
       y = "Human Capital Index (values between 0 and 1)") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  )

