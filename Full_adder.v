//full adder using verilog language
module fa(A,B,s,carry,Cin);
  input A,B,Cin;
  output reg s,carry;
  always @(*)
    begin
      s=A^B^Cin;
      carry=A&B|(Cin&(A^B));
    end
endmodule
module fa_tb;
  reg A, B,Cin;
  wire s, carry;

  // Instantiate the full adder module
  fa u(.s(s), .carry(carry), .A(A), .B(B), .Cin(Cin));

  initial begin
    // Display header
    $display("T\tA B Cin | s carry");
    $monitor("%0t\t%b %b %b   | %b   %b", $time, A, B, Cin, s, carry);

    // Apply test vectors
    #5 A=0; B=0; Cin=0;
    #5 A=0; B=0; Cin=1;
    #5 A=0; B=1; Cin=0;
    #5 A=0; B=1; Cin=1;
    #5 A=1; B=0; Cin=0;
    #5 A=1; B=0; Cin=1;
    #5 A=1; B=1; Cin=0;
    #5 A=1; B=1; Cin=1;
    #5 $stop;
  end
endmodule
