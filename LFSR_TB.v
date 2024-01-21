`timescale 1ns/1ps

module LFSR_TB ;
  parameter Shift_bits_TB=4;

  
  reg [Shift_bits_TB-1:0]  SEED_TB;
  reg                      CLK_TB;
  reg                      RST_TB;
  wire                     OUT_TB;
  wire                     Valid_TB;
  
initial
  begin
    $dumpfile("LFSR.vcd");
    $dumpvars ;

//initial values
CLK_TB = 1'b0;
RST_TB=1'b1;
SEED_TB='b1001;

#10
RST_TB=1'b0;  
#10
    $display ("*** TEST CASE 1 ***");
  if((Valid_TB==1'b1)&&(OUT_TB==1'b1))
     $display ("*** Rest TEST CASE 1 failed ***");
  else
     $display ("*** Rest TEST CASE 1 success ***");       
#10
RST_TB=1'b1;

#900

if((OUT_TB == 1'b0) && (Valid_TB == 1'b1))
$display("Test Case 2 passed");
else
$display("Test case 2 failed");

#100

if((OUT_TB == 1'b0) && (Valid_TB ==1'b1))
$display("Test Case 3 passed");
else
$display("Test case 3 failed");

#100

if((OUT_TB == 1'b1) && (Valid_TB ==1'b1))
$display("Test Case 4 passed");
else
$display("Test case 4 failed");

#100

if((OUT_TB == 1'b1) && (Valid_TB ==1'b1))
$display("Test Case 5 passed");
else
$display("Test case 5 failed");

#100
    $stop;
    end
  
 always
  begin
     #50  CLK_TB = ~CLK_TB ;
  end

  
  LFSR #( .Shift_bits(Shift_bits_TB) ) DUT
  (
  .Seed(SEED_TB),
  .CLK(CLK_TB),
  .RST(RST_TB),
  .OUT(OUT_TB),
  .Valid(Valid_TB)
);
endmodule