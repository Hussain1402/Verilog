//Code for half adder using verilog
module ha(A,B,s,carry);
  input A,B;
  output reg s,carry;
  always @(*)
    begin
      s=A^B;
      carry=A&B;
    end
endmodule
module ha_tb;
  reg A, B;
  wire s, carry;

  // Instantiate the half adder module
  ha u(.s(s), .carry(carry), .A(A), .B(B));

  initial begin
    // Display header
    $display("T\tA B | s carry");
    $monitor("%0t\t%b %b | %b   %b", $time, A, B, s, carry);

    // Apply test vectors
    #5 A=0; B=0;
    #5 A=0; B=1;
    #5 A=1; B=0;
    #5 A=1; B=1;
    #5 $stop;
  end
endmodule
