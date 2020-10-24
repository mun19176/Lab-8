//EJ_1
module CounterLoad(input wire [10:0]D, input wire ENABLE, CLK, RESET, LOAD, output reg [10:0]out);

	always @(posedge CLK or posedge LOAD or posedge RESET)
		if (RESET) begin
			out <= 12'b0 ;
		end else if (LOAD) begin
			out <= D;
		end else if (ENABLE) begin
			out <= out + 1;
		end
endmodule 
//Ej_2
module ROM (input wire [10:0]AD, output wire [7:0]D);           
	reg [10:0] mem [0:4095] ;  
    
	assign D = mem[AD];
initial begin
  $readmemb("Memory.txt", mem); 
end

endmodule

//EJ_3
module ALU (input wire [3:0]A, input wire [3:0]B, input wire [2:0]sel, output reg [3:0]OUT); 
reg [4:0]X;
reg menor;
	always @ (A or B or sel) 
		case (sel) 
			0 : OUT = A&B; 
			1 : OUT = A | B; 
			2 : begin
				X = A + B; 
				OUT[0] = X[0];
				OUT[1] = X[1];
				OUT[2] = X[2];
				OUT[3] = X[3];
				end
			3 : OUT = 0;
			4 : OUT = A&~B;
			5 : OUT = A | ~B;
			6 : begin
				X = A - B; 
				OUT[0] = X[0];
				OUT[1] = X[1];
				OUT[2] = X[2];
				OUT[3] = X[3];
				end
			7 : begin
				menor = (A < B);
				if (menor)begin
				OUT = 4'b1111;
				end else begin
				OUT = 0;
				end
				end
			default : $display("Existe error"); 
		endcase 
    
endmodule