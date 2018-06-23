
module counter_memory (
   reset,
   enable,
   divideby,
  clk,
   // output LEDs and 7-segment displays
   go
   );

input  reset;    // two board-level push buttons KEY1 - KEY0    // ten board-level switches SW9 - SW0
input  enable; 
input [5:0] divideby; 
input clk;
output reg go;
 reg [9:0]  LEDR;
  reg [5:0] counter;

//============================================================================
//  reg/wire declarations
//============================================================================


reg [5:0] total;
reg [5:0] counter_c;

//============================================================================
// Board-LED related circuits
//============================================================================

always @(*) begin
    LEDR[9:0] = 10'b0;
    counter_c = counter;
    go = 1'b0;
    total = divideby - 6'b01;
    if (enable) begin
      if(counter_c != total) begin
        counter_c = counter_c + 6'b01;
      end
      else if (counter_c == total) begin
        counter_c = 6'b0;
      end // else if (counter_c == total)
    
      if ((counter_c == 6'b0) && (divideby != 6'b0)) begin
        go = 1'b1;
      end
      
       
      if (divideby == 6'b0) begin
        LEDR[9:0] = 10'b1111_1111_11;
        counter_c = 6'b0;
        go = 1'b0;
      end
    end 
   if (reset == 1'b0) begin 
        counter_c = 6'b000000;
  end
 
end

always@(posedge clk) begin
      counter <= #1 counter_c;
      
   ///counter <= #1 counter_c;
  
end 


endmodule
