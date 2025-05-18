///////////////////////////////////////////////////////////////////////////////
// File:        testbench.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: Testbench
///////////////////////////////////////////////////////////////////////////////


`include "pkg.sv"
module tb;

  mul_if vif();
  
  mul dut (.a(vif.a), .b(vif.b), .c(vif.c));

  initial 
  begin
  uvm_config_db#(virtual mul_if)::set(null, "*", "vif", vif);
  run_test("test"); 
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end



endmodule
