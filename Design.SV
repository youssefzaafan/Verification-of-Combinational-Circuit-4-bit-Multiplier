///////////////////////////////////////////////////////////////////////////////
// File:        Design.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: DUT & Interface
///////////////////////////////////////////////////////////////////////////////

module mul(
input [3:0] a,b,
output [7:0] c
);
assign c = a * b;
    
endmodule

interface mul_if;
    logic [3:0] a,b;
    logic [7:0] c;
endinterface