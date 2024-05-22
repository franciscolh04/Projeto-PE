# Fixar a semente
set.seed(4588)

# Definir parâmetros
m <- 5000      # número de pares de amostras
n <- 100       # tamanho da amostra
lambda_0 <- 2.40  # parâmetro lambda sob H0
lambda_1 <- 2.65  # parâmetro lambda sob H1
k <- 2.623    # valor crítico

# Inicializar contadores de erros
erro_tipo_I <- 0
erro_tipo_II <- 0

# Gerar e analisar as amostras
for (i in 1:m) {
  # Amostra sob H0
  amostra_H0 <- rpois(n, lambda_0)
  media_H0 <- mean(amostra_H0)
  
  # Amostra sob H1
  amostra_H1 <- rpois(n, lambda_1)
  media_H1 <- mean(amostra_H1)
  
  # Teste de hipóteses
  if (media_H0 > k) {
    erro_tipo_I <- erro_tipo_I + 1
  }
  if (media_H1 <= k) {
    erro_tipo_II <- erro_tipo_II + 1
  }
}

# Calcular frequências relativas
prob_erro_I <- erro_tipo_I / m
prob_erro_II <- erro_tipo_II / m

# Calcular o quociente
quociente <- prob_erro_II / prob_erro_I
quociente <- round(quociente, 2)

# Exibir o resultado
quociente

# Resultado final = 6.55
