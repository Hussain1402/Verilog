//Half subtractor using verilog language
module hs(A,B,diff,borrow);
  input A,B;
  output reg diff,borrow;
  always @(*)
    begin
      diff=A^B;
      borrow=(~A)&B;
    end
endmodule
module hs_tb;
  reg A, B;
  wire diff, borrow;

  // Instantiate the half subtractor module
  ha u(.diff(diff), .borrow(borrow), .A(A), .B(B));

  initial begin
    // Display header
    $display("T\tA B | difference borrow");
    $monitor("%0t\t%b %b | %b   %b", $time, A, B, diff, borrow);

    // Apply test vectors
    #5 A=0; B=0;
    #5 A=0; B=1;
    #5 A=1; B=0;
    #5 A=1; B=1;
    #5 $stop;
  end
endmodule
      
