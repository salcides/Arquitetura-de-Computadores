Unidade lógica e aritimética com entradas de 32 bits

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
