//Unidade lógica e aritimética entradas de 32 bits
//
//Igor Rodrigues Salcides
//Gabriel Saade Pagani
//
//Fonte: Digital Design and Computer Architecture ARM® Edition © 2015 by Elsevier Inc.


module ULA (input logic [31:0] A, B,
	    input logic [1:0] ALUControl,
	    output logic [31:0] Result,
	    output logic [3:0] ALUFlags);

logic neg, zero, carry, overflow;
logic [31:0] condinvb;
logic [32:0] sum;
assign condinvb = ALUControl[0] ? ~B : B;
assign sum = A + condinvb + ALUControl[0];

always_comb
    casex (ALUControl[1:0])
    2'b0?: Result = sum;
    2'b10: Result = A & B;
    2'b11: Result = A | B;
endcase

assign neg = Result[31];
assign zero = (Result == 32'b0);
assign carry = (ALUControl[1] == 1'b0) & sum[32];
assign overflow = (ALUControl[1] == 1'b0) & ~(A[31] ^ B[31] ^ ALUControl[0]) & (A[31] ^ sum[31]);
		
assign ALUFlags = {overflow, carry, neg, zero};

endmodule
