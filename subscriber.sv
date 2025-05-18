///////////////////////////////////////////////////////////////////////////////
// File:        subscriber.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_subscriber class
///////////////////////////////////////////////////////////////////////////////

covergroup group_1 (ref transaction t);
  t_a :coverpoint t.a {
    bins a_vals[] = {[0:15]};
  }
 t_b: coverpoint t.b {
    bins b_vals[] = {[0:15]};
  }
endgroup

class subscriber extends uvm_subscriber #(transaction);
  `uvm_component_utils(subscriber)

  transaction tr;
  group_1 covgrp;

  function new(string name = "subscriber", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    covgrp = new(tr);
  endfunction

  function void write(transaction t);
    tr = t;
    `uvm_info("SUB", $sformatf("Received transaction a=%0d b=%0d c=%0d", tr.a, tr.b, tr.c), UVM_MEDIUM)
    covgrp.sample();
  endfunction

 function void final_phase(uvm_phase phase);
  automatic real a_cov;
  automatic real b_cov;
  super.final_phase(phase);
  a_cov = covgrp.t_a.get_coverage();
  b_cov = covgrp.t_b.get_coverage();
  `uvm_info("SUB", $sformatf("Coverage a = %.2f%%, b = %.2f%%", a_cov, b_cov), UVM_LOW)
endfunction


endclass
