///////////////////////////////////////////////////////////////////////////////
// File:        agent.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_agent class
///////////////////////////////////////////////////////////////////////////////
class agent extends uvm_agent;
`uvm_component_utils(agent)

driver drv;
monitor mon;
uvm_sequencer#(transaction) seqr;

//Constructor
function new(string name = "agent", uvm_component parent );
super.new(name,parent);
endfunction

//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
drv = driver::type_id::create("drv",this);
mon = monitor::type_id::create("mon",this);
seqr = uvm_sequencer#(transaction)::type_id::create("seqr",this);
endfunction

//Connect Phase
function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export);
endfunction

endclass
