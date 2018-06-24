module controller_tb;

//----- Declaration

wire [7:0]     HEX0;
wire [7:0]     HEX1;
wire [7:0]     HEX2;
wire [7:0]     HEX3;
wire [7:0]     HEX4;
wire [7:0]     HEX5;
wire [9:0]     LEDR;

reg  [1:0]    KEY;
reg [9:0]      SW;

wire [6:0] balance;

wire [6:0] value;

reg clock = 1'b0;



//----- testgen submodue
controller UUT(KEY, SW, clock, LEDR, HEX0, HEX1, HEX4, HEX5, balance, value);//----- Main test 
// This block is executed only once starting at the beginning of the simulation.



initial begin
   KEY[0] = 1'b0;
   #10
   clock = ~clock;
   #10

   $write("Testing FULL\n"); 
   KEY[0] = 1'b1;
   KEY[1] = 1'b1;
   clock = ~clock;
   #10


   repeat (8) begin
    #10
   KEY[1] = 1'b0;
   SW[3:0] = 4'b1000;
   #10
   $write("Value: %d\n", value);
   clock = ~clock;
   #10
   $write("Balance: %d, HEX1 Value: %b, HEX0 value: %b\n", balance, HEX1, HEX0);
   $write("LEDR[9:5]: %b\n", LEDR[9:5]);
   $write("\n");
   KEY[1] = 1'b1;
   end 

    // repeat (5)
   /*$write("HEX1 Value: %b, HEX0 value: %b\n", HEX1, HEX0);
   $write("Balance: %d, HEX5 Value: %b, HEX4 value: %b\n", balance, HEX5, HEX4);

   $write("Testing dimes\n"); 
   KEY[1] = 1'b0;
   SW[0] = 1'b0;
   SW[1] = 1'b0;
   SW[2] = 1'b1;
   SW[3] = 1'b0;
   #10;
   $write("HEX1 Value: %b, HEX0 value: %b\n", HEX1, HEX0);
   $write("Balance: %d, HEX5 Value: %b, HEX4 value: %b\n", balance, HEX5, HEX4);*/
$finish;    
end


/*always begin
   clock = ~clock;
   #1;
   $write("Balance: %d, HEX5 Value: %b, HEX4 value: %b\n", balance, HEX5, HEX4);
   $write("\n");
   #1;
   
end*/

         // ends simulation


endmodule
