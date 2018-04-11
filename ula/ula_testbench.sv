//Testbench da Unidade lógica e aritimética entradas de 32 bits
//
//Igor Rodrigues Salcides
//Gabriel Saade Pagani
//
//Fonte: Digital Design and Computer Architecture ARM® Edition © 2015 by Elsevier Inc.

module ula_testbench();
	logic clk;
	logic [31:0] A, B, y, y_expected;
	logic [1:0] ALUControl;
	logic [31:0] vectornum, errors;
	logic [99:0] testvectors[10000:0];

// instantiate device under test
	ULA teste(A, B, ALUControl, y);

// generate clock
always begin
    clk = 1; #50; clk = 0; #50;
end

// at start of test, load vectors
initial begin
	$readmemh("testvect.txt", testvectors);
    vectornum = 0; errors = 0;
end

// apply test vectors at rising edge of clock
always @(posedge clk)
    begin
	#1;
	ALUControl = testvectors[vectornum][97:96];
	A = testvectors[vectornum][95:64];
	B = testvectors[vectornum][63:32];
	y_expected = testvectors[vectornum][31:0];
end

// check results on falling edge of clock
always @(negedge clk)
    begin
	if (y !== y_expected) begin
	    $display("Error in vector %d", vectornum);
	    $display(" Inputs : A = %h, B = %h, ALUControl = %b", A, B, ALUControl);
	    $display(" Outputs: y = %h (%h expected)",y, y_expected);
	    errors = errors+1;
	end

	vectornum = vectornum + 1;

	if (testvectors[vectornum][0] === 1'bx) begin
	    $display("%d tests completed with %d errors", vectornum, errors);
	    $stop;
	end
end

endmodule
