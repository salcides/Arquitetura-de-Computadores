;Trabalho de Arquitetura de Computadores 2018-01
;IFES - Engenharia de Controle e Automação
;Igor Rodrigues Salcides e Gabriel Saade Pagani
;PG de razão 2


		MOV R1, #1		;R1 será o contador
		MOV R5, #400   		;X = 4 (posição base*100 e registrador RX da dupla)
		MOV R6, #3		;Registrador 6 guarda o valor inicial da PG = 3
		STR R6, [R5]		;Guarda o valor base no endereço de memória base
		MOV R7, #0x80000000	;Valor máximo que a PG pode assumir (2147483648)
		
WHILE		CMP R1, #10 		;Verificando condição de parada
		BEQ GG			;10 termos: vai pro final
		LSL R6, R6, #1		;Multiplica o valor base por 2 (shift para esquerda)
		ADD R1, R1, #1  	;Incrementa o contador
		ADD R5, R5, #4  	;Incrementa a posição de memória em 32 bits
		STR R6, [R5]		;Guarda valor atual no endereço devidamente deslocado
		TST R6, R7		;Verifica se o valor da PG ultrapassou o valor máximo
		BNE GG			;Se ultrapassar, termina. O PDF não informa se o programa precisa parar, escolhemos parar.
		B WHILE			;Se não ultrapassar, continua
		
GG		LDR R4, [R5]
