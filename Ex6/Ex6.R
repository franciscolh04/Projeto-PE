# Fixar a semente
set.seed(1948)

# Definir parâmetros
n <- 30
lambda <- 1/4
num_amostras <- 1000
limite <- 90

# Simulação
simulated_Y <- replicate(num_amostras, sum(rexp(n, rate = lambda)))
prob_simulada <- mean(simulated_Y > limite)

# Cálculo exato usando a distribuição Gama
forma <- n
taxa <- lambda
prob_exata <- 1 - pgamma(limite, forma, rate = taxa)

# Diferença absoluta
diferenca <- abs(prob_simulada - prob_exata) * 100
diferenca <- round(diferenca, 4)

# Exibir os resultados
cat("Probabilidade simulada: ", prob_simulada, "\n")
cat("Probabilidade exata: ", prob_exata, "\n")
cat("Diferença absoluta multiplicada por 100: ", diferenca, "\n")

# Resultado final = 1.1258
