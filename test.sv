///////////////////////////////////////////////////////////////////////////////
// File:        test.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_test class
///////////////////////////////////////////////////////////////////////////////

class test extends uvm_test;
`uvm_component_utils(test)
//Constructor 
function new(string name = "test", uvm_component parent = null);
super.new(name, parent);
endfunction

env e ;
generator gen;

//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
e = env::type_id::create("env",this);
gen= generator::type_id::create("gen");
endfunction

//Run Phase
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
gen.start(e.ag.seqr);
#20;
phase.drop_objection(this);
endtask
 

endclass