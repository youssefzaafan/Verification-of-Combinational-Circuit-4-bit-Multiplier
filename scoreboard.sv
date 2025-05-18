///////////////////////////////////////////////////////////////////////////////
// File:        scoreboard.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_scoreboard class
///////////////////////////////////////////////////////////////////////////////
class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
uvm_analysis_imp#(transaction,scoreboard) recv;
//transaction tr;

//Constructor
function new(string name = "scoreboard", uvm_component parent);
super.new(name, parent);
endfunction

//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
recv= new("recv", this);
endfunction

//Write
function void write(transaction tr);
//Write transaction to scoreboard
if(tr.a * tr.b == tr.c)
    `uvm_info("SCO", $sformatf("Test Passed -> a : %0d  b : %0d  c : %0d", tr.a, tr.b, tr.c), UVM_NONE)
else
    `uvm_info("SCO", $sformatf("Test Failed -> a : %0d  b : %0d  c : %0d", tr.a, tr.b, tr.c), UVM_NONE)
    $display("----------------------------------------------------------------");
endfunction
endclass