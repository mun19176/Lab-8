//EJ_1
module CounterLoad(input wire [11:0]D, input wire ENABLE, CLK, RESET, LOAD, output reg [11:0]out);

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
module ROM (input wire [11:0]AD, output wire [7:0]D);           
	reg [11:0] mem [0:4095] ;  
    
	assign D = mem[AD];
initial begin
  $readmemb("Memory.txt", mem); 
end

endmodule

//EJ_3
module ALU (input wire [3:0]A, input wire [3:0]B, input wire [2:0]sel, output reg [3:0]Y); 
reg [4:0]X;
reg menor;
	always @ (A or B or sel) 
		case (sel) 
			0 : Y = A&B; 
			1 : Y = A | B; 
			2 : begin
				X = A + B; 
				Y[0] = X[0];
				Y[1] = X[1];
				Y[2] = X[2];
				Y[3] = X[3];
				end
			3 : Y = 0;
			4 : Y = A&~B;
			5 : Y = A | ~B;
			6 : begin
				X = A - B; 
				Y[0] = X[0];
				Y[1] = X[1];
				Y[2] = X[2];
				Y[3] = X[3];
				end
			7 : begin
				menor = (A < B);
				if (menor)begin
				Y = 4'b1111;
				end else begin
				Y = 0;
				end
				end
			default : $display("Existe error"); 
		endcase 
    
endmodule