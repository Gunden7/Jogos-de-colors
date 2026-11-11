programa 
{
  inclua biblioteca Util
  inclua biblioteca Texto

  funcao logico verificar( cadeia palpit[], cadeia senha[]) {
		inteiro acertos = 0
			para (inteiro i = 0; i < 4; i = i + 1) {
				se ( palpit[i] == senha[i] ){
					acertos = acertos + 1		
	   		}
		}
		retorne acertos == 4		
	}
		
	
	funcao inicio()
	{
		//Azul, verde, amarelo, roxo e Laranja       
		cadeia opcoes[] = {"?", "?", "?", "?", "?", "?"}
    cadeia senha[4]
    para(inteiro i = 0; i < 4; i = i + 1){
      senha[i] = opcoes[Util.sorteia(0,5)]
    }
    inteiro tentativas = 10
    cadeia palpites[10][4] 
		logico acertou = falso

          escreva ("======== Jogo Senha ========\n\n")
          escreva("Cores Disponíveis:\n")
          para (inteiro i = 0; i < 6; i = i + 1){
          	escreva(opcoes[i], " ")
          }
          escreva("\nDigite quatro cores para tentar descobrir a senha!\n")
          escreva("\nPara cada cor correta, você receberá um emoji preto (?)\n") 
		escreva("E para cada cor correta, mas na posição errada, você receberá um emoji branco (?).\n\n")
		
		enquanto (tentativas > 0 e nao acertou) {
			escreva("escreva seu palpite: ")
			cadeia palpit[4]
			cadeia palpit_todo
      leia(palpit_todo)
      para (inteiro i = 0; i < 4; i = i + 1) {
        palpit[i] = Texto.extrair_subtexto(palpit_todo, i * 2, i * 2 + 2)
      } 
      
			
			acertou = verificar(palpit, senha)

			limpa()

			se (acertou) {
				escreva("Parabéns você acertou a combinação!!!!")
			} senao {
				para (inteiro i = 0; i < 4; i = i + 1) {
				palpites[10 - tentativas][i] = palpit[i]
				}
				
				escreva("Senha incorreta! você tem ",tentativas - 1," tentativas restantes\n")
				escreva("Cores Diponíveis:\n")
				para (inteiro i = 0; i < 6; i = i + 1){
          			escreva(opcoes[i]," ")
				}
				escreva("\n")

				para (inteiro i = 0; i < 10 - tentativas + 1; i = i + 1){
					inteiro posicao_correta = 0
					inteiro posicao_errada = 0

					logico utiliz [] = {falso, falso, falso, falso}

					para (inteiro j = 0; j < 4; j = j + 1) {
						se (palpites[i][j] == senha[j]) {
							posicao_correta = posicao_correta + 1
							utiliz[j] = verdadeiro	
						} 
					
					}
					para(inteiro j = 0; j < 4; j = j + 1) {
						se(palpit[j] != senha[j]) {
							para(inteiro k = 0 ; k < 4; k = k + 1) {
								se(nao utiliz[k] e palpites[i][j] == senha[k]){
									posicao_errada = posicao_errada + 1
									utiliz[k] = verdadeiro
                  pare	
								}
							}
						}
					}
					escreva("Tentativa: ")
					para (inteiro j = 0; j < 4; j = j + 1){
						escreva(palpites[i][j])
					}
					escreva(" -Dicas: ")
					para (inteiro j = 0; j < posicao_correta; j = j + 1) {
						escreva("? ")	
					}
					para (inteiro j = 0; j < posicao_errada; j = j + 1) {
						escreva("? ")	
					}
					escreva("\n")
				}
			 	tentativas = tentativas - 1	
			}
		}

    se(nao acertou) {
      limpa()
      escreva("Acabaram as tentativas! A senha era:\n")
      para (inteiro i = 0; i < 4; i = i + 1) {
        escreva(senha[i])
      }
    }
	}
}
