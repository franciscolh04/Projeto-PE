# Fixar a semente
set.seed(1950)

# Definir parâmetros
n <- 23
r <- 300
m <- 170 
limite <- 1.5

# Função T
funcao_T <- function(n) {
  Z <- rnorm(n + 1)
  T <- sqrt(n) * (Z[1] / sqrt(sum(Z[-1]^2)))
  return(T)
}

# Gerar r amostras de m valores de T
proporcoes <- numeric(r)

for (i in 1:r) {
  valores_T <- replicate(m, funcao_T(n))
  proporcoes[i] <- mean(valores_T <= limite)
}

# Calcular a média das proporções
p_aproxim <- mean(proporcoes)

# Calcular a probabilidade exata usando a função pt do R
p_exata <- pt(limite, df = n)

# Calcular a diferença absoluta e multiplicar por 100
diferenca <- abs(p_aproxim - p_exata) * 100

# Arredondar o resultado a 5 casas decimais
resultado <- round(diferenca, 5)

# Exibir o resultado
resultado

# Resultado final = 0.06266