// testgen_tb.vt
//
// Testbench for testgen.v
//
// 2018/04/23  Written (BB)


// Test bench module has no inputs or outputs
module bcd2driver_tb;

//----- Declaration

wire [7:0]     HEX0;
wire [7:0]     HEX1;
wire [7:0]     HEX2;
wire [7:0]     HEX3;
wire [7:0]     HEX4;
wire [7:0]     HEX5;
reg [9:0]      SW;


reg clock = 1'b0;
reg [6:0] in;

wire gt99;
wire [6:0] ones;


//----- testgen submodule
bcd2driver UUT(in, HEX0, HEX1, gt99);//----- Main test 
// This block is executed only once starting at the beginning of the simulation.
initial begin
   // creates a dump file of signals which can be displayed by the viewer.
   //$recordfile("testgen_tb");
   //$recordvars(testgen_tb);

   // $write is a simulator directive that prints text to the
   // simulator screen when this line is executed
   $write("Testing ones\n"); 
   in = 7'd22;
   #10;
   $write("Input: %d, Output: %b %b, gt99: %b\n", in, HEX1, HEX0,gt99);

   in = 7'd58;
   #10;
   $write("Input: %d, Output: %b %b, gt99: %b\n", in, HEX1, HEX0,gt99);

   in = 7'd106;
   #10;
   $write("Input: %d, Output: %b %b, gt99: %b\n", in, HEX1, HEX0,gt99);

$finish;    

         // ends simulation
end

endmodule