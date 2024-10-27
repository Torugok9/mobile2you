# Expressão
expressao = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"

# Passo 1: Contar a quantidade de areias
quantidade_areias = expressao.count(".")

# Passo 2: Contar e remover os diamantes
def contar_diamantes(expressao)
  diamantes = 0
  pilha = 0

  expressao.each_char do |char|
    if char == '<'
      pilha += 1
    elsif char == '>' && pilha > 0
      pilha -= 1
      diamantes += 1
    end
  end

  diamantes
end

# Passo 3: Exibir apenas a quantidade de diamantes extraídos
puts "Quantidade de diamantes extraídos: #{quantidade_areias}"
puts "Quantidade de areias extraídas: #{contar_diamantes(expressao)}"