module memorycont(


	//////////// SEG7 //////////
	i

	//////////// KEY //////////
	input 		      [6:0]		HEX,

	//////////// LED //////////
	output		     [9:0]		LEDR,
	input 		          		MAX10_CLK1_50,

	//////////// SW //////////
	input 		     [9:0]		SW,
	output 			 [23:0]		display
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [3:0] mem [0:3]; 	        
reg write_enable = 1'b0;

parameter S1 = 4'd0;
parameter REVERSE = 4'd1; 
parameter S3 = 4'd3;
parameter S4 = 4'd4;
parameter WAIT = 4'd6;

reg state_c;
reg state;



reg wr_addr = 4'd0;
reg wr_data = 4'd0;
reg rd_addr = 4'd0;
reg rd_data = 4'd0;

reg clock = MAX10_CLK1_50;

reg reset = ~KEY[0];

reg display1_c;
reg display1;
reg go;




/*it nealways@(posedge clock)
	if (write_enable == 1'b1. && wr_addr <= 4'd3) begin
		mem[wr_addr] <= #1 wr_data;
		wr_adder = wr_addr + 1;
		wr_data = wr_data + 1;
	end // if (write_enable == 1'b1. && wr_addr <= 4'd3)
	else if (wr_addr == 4'd3) begin
		reverse = 1'b1;
		rd_addr = wr_data; 

	end // else if (wr_addr == 4'd3)

	if(reverse && (rd_addr >= 4'd0)) begin
		rd_data <= #1 mem[rd_addr];
		rd_addr = rd_addr - 1;
		display0 <= #1 rd_data + 1;
		LEDR[9] = 1'b1;
		if(rd_addr == 4'd0) begin
			mem[0] <= #1 4'd05;
			mem[1] <= #1 4'd06;
		end
	end // if(reverse)*/

always @(*) begin
	state_c = state;
	display1_c = display1;
	case(state)
		S1: begin
			if (go) begin
				if (wr_addr <= 4'd3) begin
					wr_adder = wr_addr + 1;
					wr_data = wr_data + 1;
				end // if (write_enable == 1'b1. && wr_addr <= 4'd3)
				if(wr_addr == 4'd3) begin
					state_c = REVERSE;		
				end
			end // if (go)
		end // S1:
		REVERSE: begin
			if (go) begin
				if(rd_addr >= 4'd0) begin 
					if(rd_addr == 4'd0) begin
						LEDR[9] = 1'b0;
						state_c = S3;
					end // if(rd_addr == 4'd0)

					display1_c = rd_addr +1;
					rd_addr = rd_addr - 1;
					LEDR[9] = 1'b1;

				end // if(rd_addr >= 4'd0)		
			end 
		end
		S3: begin
			if (go) begin
				wr_addr = 4'b0;
				wr_data = 4'd05;
				wr_addr = 4'd1;
				wr_data = 4'd06;
				state_c = S4;
			end 
		end // S3:

		S4: begin
			if (go) begin
				if(rd_addr >= 4'd0) begin 
					if(rd_addr == 4'd0) begin
						LEDR[9] = 1'b0;
						state_c = WAIT;
					end // if(rd_addr == 4'd0)

					display1_c = rd_addr +1;
					rd_addr = rd_addr - 1;
					LEDR[9] = 1'b1;

				end // if(rd_addr >= 4'd0)		
			end 
		WAIT: begin 
			LEDR[9] = 1'b1; 
			write_enable = 1'b0;
			if (reset == 1'b1) begin
				state_c = S1;
				write_enable = 1'b1;
			end // if (reset == 1'b1)
		end // WAIT:
	endcase // state
	if(reset) begin
		state_c = S1;
		write_enable = 1'b1;
	end
end



always @(posedge clock) begin
	state <= #1 state_c;
	display1 <= #1 display1_c;

end

always @ (posedge clock)
	if (write_enable == 1'b1) begin
		mem[addr_wr] <= #1 wr_data;
	end // if (write_enable == 1'b1)
	rd_data <= #1 mem[rd_addr];
end // always @(*)

counter_memory out0 (reset, enable, clock, go);
bcd_memory out1 (wr_addr, HEX[5]);
bcd_memory out2 (wr_data, HEX[4]);
bcd_memory out3 (rd_addr, HEX[3]);
bcd_memory out4 (rd_data, HEX[2]);
bcd_memory out5 (display1_c, HEX[1]);

endmodule