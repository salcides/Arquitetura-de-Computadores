;Trabalho de Arquitetura de Computadores 2018-01
;IFES - Engenharia de Controle e Automa��o
;Igor Rodrigues Salcides e Gabriel Saade Pagani
;PG de raz�o 2


;Verificar depois com o professor a inicializa��o de vari�veis
		MOV R1, #1	;R1 ser� o contador
;X = 40 (posi��o base da dupla)
;
;

WHILE		CMP R1, #10 	;Verificando condi��o de parada
		BEQ GG		;10 termos: vai pro final
		LSL R, #2	;Multiplica o valor base por 2

GG				;Finaliza