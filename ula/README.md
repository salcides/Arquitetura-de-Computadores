# Unidade lógica e aritimética com entradas de 32 bits

## arquivo ULA.sv <br />
module ULA (input logic [31:0] A, B,<br />
	    <p>input logic [1:0] ALUControl,<br />
	    output logic [31:0] Result,<br />
	    output logic [3:0] ALUFlags);<br /></p>
	    
### ALUControl: <br />
        00: Soma (A + B)
        01: Subtração (A - B)
        10: AND (A & B)
        11: OR (A | B)
  
### ALUFlags:<br />
        (Overflow, Carry, Negative, Zero)


# Testbanch
## arquivo ula_testbanch.sv
## arquivo testvect.txt

o teste é realizado pelo arquivo .sv que lê as informações do arquivo .txt<br />
cada linha do .txt contem as informações (nesta ordem):<br />
FLAGS_ALUControl_A_B_Y

as flags e a saida y são os resultados esperados.

o programa salva um arquivo erros.txt contendo quantos erros foram encontrados em tantos testes.
