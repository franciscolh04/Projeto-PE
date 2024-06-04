install.packages("ggplot2")
library(ggplot2)

# Ler dados do ficheiro electricity.xlsx
dados <- readxl::read_excel("/Users/franciscoheleno/Documents/Coding/R/Projeto PE/Projeto-PE/Ex3/electricity.xlsx")

ano <- 2015
countries <- c("IEA Total", "Italy", "Latvia")

data_per_year_per_country <- subset(dados, PRODUCT=="Renewables" & COUNTRY %in% countries & YEAR>=ano)
data_per_year_per_country$share <- as.numeric(data_per_year_per_country$share)*100

# Construir gráfico
ggplot(data_per_year_per_country, aes(x = as.Date(paste(YEAR, MONTH, "01", sep = "-")), y = share, color = COUNTRY)) +
  geom_line() +
  geom_point() +
  scale_y_continuous(limits = c(0, 100)) +
  labs(title = "Monthly Evolution of the Proportion of Electrical\n Energy produced from Renewable Sources",
       subtitle = "From 2015 to 2022",
       x = "Time",
       y = "Proportion of produced Electrical Energy (%)") +
  scale_color_manual(values = c("IEA Total" = "gold", "Italy" = "brown1", "Latvia" = "cyan4")) +
  theme_minimal() + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),plot.subtitle = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  )
  
