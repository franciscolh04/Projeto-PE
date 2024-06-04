#install.packages("pracma")
library(pracma)

# Fixar a semente
set.seed(1592)

# Observações
observacoes <- c(31.8,31.7,35.2,37.1,31.7,36.1,36.3,33.2,34.3,37.5,30.4,34.6,32.4,31.7,30.2,34.3,35.6,34.9,38.9)

# Extração ao acaso e sem reposição de n = 12 observações
amostra <- sample(observacoes, 12, replace = FALSE)

# Intervalo de confiança para sigma^2
n <- 12
gamma <- 0.96
alpha <- 1 - gamma

s2 <- var(amostra)
a <- qchisq((1 - gamma) / 2, n - 1)
b <- qchisq((1 + gamma) / 2, n - 1)

IC_inf <- (n - 1) * s2 / b
IC_sup <- (n - 1) * s2 / a
IC <- c(IC_inf, IC_sup)

# Definir a função do sistema de equações
equations <- function(x) {
  c <- x[1]
  d <- x[2]
  
  eq1 <- pchisq(d, n - 1) - pchisq(c, n - 1) - gamma
  eq2 <- dchisq(d, n + 3) - dchisq(c, n + 3)
  
  return(c(eq1, eq2))
}

# Intervalo de confiança minimizado para sigma^2
palpite_inicial <- c(a, b)
solucao <- fsolve(equations, palpite_inicial)
c <- solucao$x[1]
d <- solucao$x[2]

IC_min_inf <- (n - 1) * s2 / d
IC_min_sup <- (n - 1) * s2 / c
IC_min <- c(IC_min_inf, IC_min_sup)

# Diferença nas amplitudes dos intervalos de confiança
amplitude_inicial <- IC_sup - IC_inf
amplitude_minimizada <- IC_min_sup - IC_min_inf
diferenca_amplitude <- round(amplitude_inicial - amplitude_minimizada, 3)

# Resultados
IC
IC_min
diferenca_amplitude

# Resultado final = 2.276