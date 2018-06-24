

// Test bench module has no inputs or outputs
module combb_tb;

//----- Declaration

reg           clock, v_sync;
reg  [9:0]         SW;
reg  [1:0]         KEY;
reg  [9:0]         col;
reg   [8:0]         row;
wire  [3:0]         red;
wire  [3:0]         blue;
wire  [3:0]         green;
wire [9:0] topleft_col, bottomright_col, topright_col, bottomleft_col;
wire [8:0] topleft_row, topright_row, bottomleft_row, bottomright_row;

comb_ckt_generator comb_ckt (v_sync, clock, col, row, red, green, blue, KEY, SW);

initial begin
   // creates a dump file of signals which can be displayed by the viewer.
   //$recordfile("testgen_tb");
   //$recordvars(testgen_tb);

   // $write is a simulator directive that prints text to the
   // simulator screen when this line is executed
   $write("Beginning simulation\n");
	SW[7:5] = 3'b000;
	SW[4] = 1'b0;
	SW[9:8] = 2'b00; 

   clock = 1'b0;
   #100
   clock = 1'b1;
   #100

   col  = 10'd100; // center of the screen
   row = 9'd80;

   
SW[9:8] = 2'd00; 
SW[4] = 1'b0;
SW[7] = 1'b0;

col = 10'd50;
row = 9'd50;
	if (col <= 9'd128 || row <= 9'd255) begin
repeat (10) begin
	clock = ~clock;
	#10
	v_sync = ~v_sync;
	col = col + 10'd1;
	row = row + 9'd1;
end
end

SW[9:8] = 2'd00; 
SW[4] = 1'b0;
SW[7] = 1'b1;

col = 10'd50;
row = 9'd50;
	if (col <= 9'd128 || row <= 9'd255) begin
repeat (100) begin
	clock = ~clock;
	#10
	v_sync = ~v_sync;
	col = col + 10'd1;
	row = row + 9'd1;
end
end


   SW[7:5] = 3'b0001;

      col  = 10'd60; // center of the screen
   row = 9'd200;



$finish;
end // initial


   
 

endmodule // top_tb