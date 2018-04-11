# Unidade lógica e aritimética com entradas de 32 bits
### arquivo ULA.sv

module ULA (input logic [31:0] A, B,
	    input logic [1:0] ALUControl,
	    output logic [31:0] Result,
	    output logic [3:0] ALUFlags);
      
ALUControl: 
        00: Soma (A + B)
        01: Subtração (A - B)
        10: AND (A & B)
        11: OR (A | B)
  
ALUFlags:
        (Overflow, Carry, Negative, Zero)


# Testbanch
### arquivo ula_testbanch.sv
### arquivo testvect.txt

o teste é realizado pelo arquivo .sv que lê as informações do arquivo .txt
cada linha do .txt contem as informações (nesta ordem):
FLAGS_ALUControl_A_B_Y

as flags e a saida y são os resultados esperados.

o programa salva um arquivo erros.txt contendo quantos erros foram encontrados em tantos testes.
