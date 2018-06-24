
module bcd2driver(
   input [6:0] in,
   output reg [7:0] out0,
	output reg [7:0] out1,
	output reg gt99
   );
   
   reg [6:0] ones;
   //reg ones;
   parameter ZERO =  8'b1100_0000;
   parameter ONE =   8'b1111_1001;
   parameter TWO =   8'b1010_0100;
   parameter THREE =  8'b1011_0000;
   parameter FOUR =   8'b1001_1001;
   parameter FIVE =   8'b1001_0010;

   parameter SIX =   8'b1000_0010;
   parameter SEVEN =   8'b1111_1000;
   parameter EIGHT =   8'b1000_0000;
   parameter NINE =   8'b1001_1000;
  
   parameter DASH = 8'b1011_1111;

   wire fifties = 7'd50;	
   wire twenties = 7'd20;   


   // etc.

   // etc.
	always @(*)begin 
       out0 = ZERO;
       out1 = ZERO;
       gt99 = 1'b0;
         if (in >= 7'd0 && in < 7'd10) begin
         case (in)
            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
               out1 = ZERO;
            end
            // etc
            7'd1: begin
               out0 = ONE;
               out1 = ZERO;
            end
            7'd2: begin
               out0 = TWO;
               out1 = ZERO;
            end
            7'd3: begin
               out0 = THREE;
               out1 = ZERO;
            end
            7'd4: begin
               out0 = FOUR;
               out1 = ZERO;
            end
            7'd5: begin
               out0 = FIVE;
               out1 = ZERO;
            end
            7'd6: begin
               out0 = SIX;
               out1 = ZERO;
            end
            7'd7: begin
               out0 = SEVEN;
               out1 = ZERO;
            end
            7'd8: begin
               out0 = EIGHT;
               out1 = ZERO;
            end
            7'd9: begin
               out0 = NINE;
               out1 = ZERO;
            end
         endcase // in[0]
         end 
		else if (in >= 7'd10 && in < 7'd020) begin
			out1 = ONE;
         ones = in - 7'd10;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd20 && in < 7'd030) begin
			out1 = TWO;
         ones = in - 5'd20;
        case (ones)

            7'd00: begin
               out0 = ZERO; 
            end
            // etc
            7'd01: begin
               out0 = SIX;
            end
            7'd02: begin
               out0 = TWO;
            end
            7'd03: begin
               out0 = THREE;
            end
            7'd04: begin
               out0 = FOUR;
            end
            7'd05: begin
               out0 = FIVE;
            end
            7'd06: begin
               out0 = SIX;
            end
            7'd07: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd30 && in < 7'd040) begin
			out1 = THREE;
         ones = in - 7'd30;
         case (ones)
            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd40 && in < 7'd050) begin
			out1 = FOUR;
         ones = in - 7'd40;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd050 && in < 7'd060) begin
			out1 = FIVE;
         ones = in - 7'd50;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd060 && in < 7'd070) begin
			out1 = SIX;
         ones = in - 7'd60;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd70 && in < 7'd080) begin
			out1 = SEVEN;
         ones = in - 7'd70;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd80 && in < 7'd090) begin
			out1 = EIGHT;
         ones = in - 7'd80;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in >= 7'd90 && in < 7'd100) begin
			out1 = NINE;
         ones = in - 7'd90;
         case (ones)

            7'd0: begin
               out0 = ZERO; // <- At compilation, "ZERO" is replaced with 8'b1100_0000
            end
            // etc
            7'd1: begin
               out0 = ONE;
            end
            7'd2: begin
               out0 = TWO;
            end
            7'd3: begin
               out0 = THREE;
            end
            7'd4: begin
               out0 = FOUR;
            end
            7'd5: begin
               out0 = FIVE;
            end
            7'd6: begin
               out0 = SIX;
            end
            7'd7: begin
               out0 = SEVEN;
            end
            7'd8: begin
               out0 = EIGHT;
            end
            7'd9: begin
               out0 = NINE;
            end
         endcase // in[0]
		end
		else if (in > 7'd099) begin
			out1 = DASH;
			out0 = DASH;
			gt99 = 1'b1;
		end
	end
endmodule