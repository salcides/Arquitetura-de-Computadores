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
	logic [3:0] Flags;
	logic [3:0] F_expected;
	logic [31:0] linha;
	logic [105:0] testvectors[20000:0];
	integer file, erros;

// instantiate device under test
	ULA teste(A, B, ALUControl, y, Flags);
	//de acordo com as entradas de teste, calcula a saída e salva na variável y

// clock
always begin
    clk = 1; #50; clk = 0; #50;
end

// Arquivo de teste. Lê os dados em formato Hexadecimal
initial begin
    $readmemh("testvect.txt", testvectors);
    linha = 0; erros = 0;
end

// Carrega uma linha do arquivo de teste
always @(posedge clk) // carrega na subida do clock
    begin
	#1;
	F_expected = testvectors[linha][103:100];
	ALUControl = testvectors[linha][97:96]; //Entrada teste
	A = testvectors[linha][95:64]; //Entrada teste
	B = testvectors[linha][63:32]; //Entrada teste
	y_expected = testvectors[linha][31:0]; //Saída esperada teste
end

// Verificação dos resultados
always @(negedge clk) //verifica na descida do clock
    begin
	if (y !== y_expected) begin //compara saída calculada com a saída esperada
	    $display("Error in vector %d", linha);
	    $display(" Inputs : A = %h, B = %h, ALUControl = %b", A, B, ALUControl);
	    $display(" Outputs: y = %h (%h expected)", y, y_expected);
	    $display(" Flags: %h (%h expected)", Flags, F_expected);
	    erros = erros + 1;
	end

	if (Flags !== F_expected) begin //compara saída calculada com a saída esperada
	    $display("Error in vector %d", linha);
	    $display(" Inputs : A = %h, B = %h, ALUControl = %b", A, B, ALUControl);
	    $display(" Outputs: y = %h (%h expected)", y, y_expected);
	    $display(" Flags: %h (%h expected)", Flags, F_expected);
	    erros = erros + 1;
	end


	linha = linha + 1;

	if (testvectors[linha][0] === 1'bx) begin
	    $display("%d tests completed with %d errors", linha, erros);
	    //Mostra na tela quantos testes foram realizados e quantos erros
	    file = $fopen("erros.txt","w");
	    $fwrite(file,"%d erro(s) em %d teste(s)\n", erros, linha);
	    $display("\nArquivo erros.txt escrito");
	    $stop;
	end
$fclose(file);
end

endmodule
