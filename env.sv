///////////////////////////////////////////////////////////////////////////////
// File:        env.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_env class
///////////////////////////////////////////////////////////////////////////////

class env extends uvm_env;
`uvm_component_utils(env)
//Instance
agent ag;
scoreboard scb;
subscriber sub;

//Constructor
function new(string name = "env", uvm_component parent);
super.new(name, parent);
endfunction

//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
ag = agent::type_id::create("ag",this);
scb = scoreboard::type_id::create("scb",this);
sub = subscriber::type_id::create("sub",this);
endfunction

//Connect_phase 
function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
ag.mon.send.connect(scb.recv);
ag.mon.send.connect(sub.analysis_export);

endfunction
endclass