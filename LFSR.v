module LFSR 
#(parameter Shift_bits=4
)
(
input  wire [Shift_bits-1:0] Seed,
input  wire                  RST,
input  wire                  CLK,
output reg                   OUT,
output reg                   Valid
);

reg   [Shift_bits-1:0]     LFSR ; //declare shift bits for LFSR
reg      [3:0]             xor_counter ;
reg      [2:0]             shift_counter ;
wire                       FeedBack ;  //Internal signal
wire                       shift_done ;
wire                       xor_done ;


always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      LFSR<=Seed;
      OUT<=1'b0;
      Valid<=1'b0;
    end
  else if(!xor_done && !shift_done )
    begin
      LFSR<={FeedBack,LFSR[Shift_bits-1:1]};
      Valid <= 1'b0 ;
    end
  else if (xor_done && !shift_done)
    begin
      {LFSR,OUT}<={1'b0,LFSR};
      Valid <= 1'b1;
    end
  else
    Valid <= 1'b0;
 
  end
  
//start always @*
assign FeedBack=^LFSR[Shift_bits-2:0];//Xor flags from 0 to N-1

  
// Shift Xor Counter for 8 clock cylce
always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
     begin
      xor_counter <=4'b0 ;
     end
   else if (!xor_done)
     begin
      xor_counter <= xor_counter + 4'b1 ;
     end
 end
 assign xor_done = (xor_counter == 4'b1000) ? 1'b1 : 1'b0 ;
 
// Shift Counter for 4 clock cylces for output
always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
     begin
      shift_counter <= 3'b0 ;
     end
   else if (xor_done && !shift_done)
     begin
      shift_counter <= shift_counter + 3'b1 ;
     end
 end
 assign shift_done = (shift_counter == 3'b100) ? 1'b1 : 1'b0 ;



endmodule
