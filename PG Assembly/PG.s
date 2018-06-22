;Trabalho de Arquitetura de Computadores 2018-01
;IFES - Engenharia de Controle e Automação
;Igor Rodrigues Salcides e Gabriel Saade Pagani
;PG de razão 2


;Verificar depois com o professor a inicialização de variáveis
		MOV R1, #1	;R1 será o contador
;X = 4 (posição base*100 e registrador RX da dupla)
;
;

WHILE		CMP R1, #10 	;Verificando condição de parada
		BEQ GG		;10 termos: vai pro final
		LSL R, #2	;Multiplica o valor base por 2

GG				;Finaliza
