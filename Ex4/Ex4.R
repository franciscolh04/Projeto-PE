# Fixar a semente
set.seed(2336)

# Definir o número de simulações e o número de circuitos
num_simulacoes <- 650
num_circuitos <- 7

# Definir as probabilidades para os sinais de 1 a 9
probabilidades <- (1:9) / 45

# Inicializar contadores
avisos_sonoros <- 0
nao_desligado <- 0

# Simular as realizações do estado do sistema
for (i in 1:num_simulacoes) {
  # Simular os sinais dos 7 circuitos
  sinais <- sample(1:9, num_circuitos, replace = TRUE, prob = probabilidades)
  
  # Verificar se pelo menos um circuito emite o sinal 1 (sistema desligado)
  sistema_desligado <- any(sinais == 1)
  
  # Verificar se pelo menos um circuito emite o sinal 2 (aviso sonoro)
  aviso_sonoro <- any(sinais == 2)
  
  # Contar apenas as realizações onde o sistema não foi desligado
  if (!sistema_desligado) {
    nao_desligado <- nao_desligado + 1
    if (aviso_sonoro) {
      avisos_sonoros <- avisos_sonoros + 1
    }
  }
}

# Calcular a proporção de avisos sonoros em sistemas que não foram desligados
proporcao <- avisos_sonoros / nao_desligado

# Arredondar a proporção a 2 casas decimais
proporcao_arredondada <- round(proporcao, 2)

# Exibir o resultado
proporcao_arredondada

# Resultado final = 0.29