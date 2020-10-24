//PABLO MUÑOZ
module Lab_8();
  reg [11:0]D; reg[11:0]add; reg [3:0]A; reg [3:0]B; reg [2:0]sel;
  reg LOAD, EC, RESET, CLK;
  wire [11:0]COUNTER; wire [7:0]Memoria; wire [3:0]alu;
	CounterLoad U1(D, LOAD, EC, CLK, RESET, COUNTER);
	ROM U2(add, Memoria);
	ALU U3(A, B, sel, alu);

//Ej_1
initial begin
	CLK=0;
	forever #1 CLK = ~CLK;
end
  initial begin
	#3
	$display("Ej_1");
    $display("CLK D LOAD ENABLE |  COUNTER");
    $display("--------------------------------");
    $monitor("%b  %d    %b     %b   |%d", CLK, D, LOAD, EC, COUNTER);
       RESET = 1; D = 20; LOAD = 0; EC = 0;
	   #1 RESET = 0;
	   #5 LOAD = 1;
	   #5 LOAD = 0;
	   #10 EC = 0;
	   #5 EC = 1;
	   #20 LOAD = 1;
	   #5 LOAD = 0; D = 50;
	  
  end
 
//Ej_2
   initial begin
	#60
	$display("Ej_2");
    $display("ADD  | Memoria");
    $display("--------------");
    $monitor("%d   |%d", add, Memoria);
	  #1 add = 00;
	  #2 add = 55;
	  #2 add = 80;
	  #2 add = 85;
	  #2 add = 95;
	  #2 add = 96;
	  #2 add = 13;
	  #2 add = 35;
	  #2 add = 98;
	  #2 add = 68;
  end
  
//Ej_3
   initial begin
	#80
	$display("Ej_3");
    $display(" A     B   Sel  | Y");
    $display("---------------------");
    $monitor("%b %b %b  |%b", A, B, sel, alu);
	sel = 0; A = 0; B = 0;
	#1 B = 1;
	#1 A = 1;
	#1 B = 15;
	#1 A = 15;
	#2 sel = 1; A = 0; B = 0;
	#1 A = 15;
	#1 A = 0;
	#1 B = 15;
	#1 A = 15;
	#2 sel = 2; A = 0; B = 0;
	#1 A = 1; B = 1;
	#1 A = 15; B = 0;
	#1 A = 7; B = 3;
	#1 A = 15; B = 1;
	#2 sel = 3;
	#1 A = 1; B = 1;
	#1 A = 15; B = 15;
	#2 sel = 4; A = 0; B = 0;
	#1 A = 15;
	#1 B = 15;
	#2 sel = 5; A = 0; B = 0;
	#1 B = 15;
	#1 A = 15;
	#1 B = 0;
	#2 sel = 6; A = 0; B = 0;
	#1 A = 10; B = 1;
	#1 A = 15; B = 10;
	#1 A = 7; B = 6;
	#1 A = 1; B = 1;
	#2 sel = 7; A = 0; B = 0;
	#1 A = 1; B = 1;
	#1 A = 15; B = 15;
	#1 A = 1; B = 15;
	#1 A = 10; B = 11;
	#1 A = 11; B = 10;
	#1 A = 8; B = 1;
	
  end 
	initial
    #145 $finish;
  initial begin
    $dumpfile("Lab8_tb.vcd");
    $dumpvars(0, Lab_8);
  end
endmodule
